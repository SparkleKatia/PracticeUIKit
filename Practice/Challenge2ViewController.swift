//
//  Challenge2ViewController.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

// TASK: Move a button’s icon 8 pt left and its title 8 pt right, while adding 16 pt overall padding.

class Challenge2ViewController: UIViewController {

    private let button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Like", for: .normal)
        b.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        b.tintColor = .white
        b.backgroundColor = .systemBlue
        b.layer.cornerRadius = 12
        b.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        b.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        b.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
        // TODO-1: set contentEdgeInsets = (top/bot/left/right = 16)
        // TODO-2: set imageEdgeInsets so icon moves  -8 x-axis
        // TODO-3: set titleEdgeInsets so text moves  +8 x-axis
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
