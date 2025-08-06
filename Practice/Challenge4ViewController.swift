//
//  Challenge4ViewController.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

class Challenge4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let textField = PaddedTextField()
        textField.placeholder = "Type something…"
        textField.borderStyle = .roundedRect
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// TODO-1: subclass UITextField inside this file
final class PaddedTextField: UITextField {
    private let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    // TODO-2: override textRect(forBounds:) → inset bounds
    // TODO-3: override editingRect(forBounds:) → inset bounds
    // TODO-4: override placeholderRect(forBounds:) → inset bounds
}
