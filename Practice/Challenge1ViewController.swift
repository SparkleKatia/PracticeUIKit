//
//  Challenge1ViewController.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

class Challenge1ViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let content = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // MARK: – Hierarchy
        // TODO-1: add scrollView to view, content to scrollView
        view.addSubview(scrollView)
        scrollView.addSubview(content)
        scrollView.backgroundColor = .purple
        content.backgroundColor = .green
        
        // MARK: – Layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // TODO-2: constrain scrollView to the Safe Area
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            // TODO-3: constrain content to scrollView’s contentLayoutGuide (all edges)
            
            content.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            content.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            content.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        // TODO-4: give content a fixed width equal to scrollView’s frameLayoutGuide
        
        // MARK: – Styling
        content.numberOfLines = 0
        content.text = Array(repeating: "Scroll me 👋", count: 80).joined(separator: "\n")
        content.textAlignment = .center
        
        // TODO-5: use UIEdgeInsets to set
        //   • scrollView.contentInset.top = 40
        //   • scrollView.scrollIndicatorInsets.top = 40
        
        let pad: CGFloat = 40
        scrollView.contentInset = UIEdgeInsets(top: pad, left: pad, bottom: pad, right: pad)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: pad, left: 0, bottom: 0, right: 0)
    
    }
}
