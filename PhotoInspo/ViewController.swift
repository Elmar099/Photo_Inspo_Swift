//
//  ViewController.swift
//  PhotoInspo
//
//  Created by Yusif Imanov on 9/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Generate", for: .normal)

        return button
    }()
    
    let colors: [UIColor] = [
        .systemCyan,
        .systemYellow,
        .systemOrange,
        .systemBlue,
        .systemRed,
        .systemMint,
        .systemPink,
        .systemPurple
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height:
            200)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton),
                for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y:view.frame.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

