//
//  Challenge5ViewController.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

class Challenge5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 16
        card.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)

        // TODO-1: set card.layoutMargins = 24 on all sides
        
        let message = UILabel()
        message.text = "Hello layoutMarginsGuide! 👾"
        message.numberOfLines = 0
        
        view.addSubview(card)
        card.addSubview(message)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        message.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            message.leadingAnchor.constraint(equalTo: card.layoutMarginsGuide.leadingAnchor),
            message.trailingAnchor.constraint(equalTo: card.layoutMarginsGuide.trailingAnchor),
            message.topAnchor.constraint(equalTo: card.layoutMarginsGuide.topAnchor),
            message.bottomAnchor.constraint(equalTo: card.layoutMarginsGuide.bottomAnchor)
       
        ])
        
        // TODO-2: add card to view and message to card
        // TODO-3: constrain card 40 pt from leading/trailing and centerY
        // TODO-4: pin message to card.layoutMarginsGuide
    }
}
