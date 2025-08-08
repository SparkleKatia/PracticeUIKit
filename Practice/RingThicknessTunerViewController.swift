//
//  RingThicknessTunerViewController.swift
//  Practice
//
//  Created by Kateryna on 08/08/2025.
//

import UIKit

final class RingThicknessTunerViewController: UIViewController {

    private let ringView = CircularRingView()
    private let thicknessSlider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // Slider config
        thicknessSlider.minimumValue = 2
        thicknessSlider.maximumValue = 28
        thicknessSlider.value = 10
        thicknessSlider.addTarget(self, action: #selector(onChange(_:)), for: .valueChanged)

        // TODO-1: add ringView & thicknessSlider to hierarchy
        
        view.addSubview(thicknessSlider)
        view.addSubview(ringView)
        
        ringView.translatesAutoresizingMaskIntoConstraints = false
        thicknessSlider.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ringView.widthAnchor.constraint(equalToConstant: 160),
            ringView.heightAnchor.constraint(equalToConstant: 160),
            ringView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ringView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            thicknessSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            thicknessSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            thicknessSlider.topAnchor.constraint(equalTo: ringView.bottomAnchor, constant: 24)
         
        ])
        // TODO-2: ringView 160×160, centered (y: -40); slider pinned below with 24 side insets
        // TODO-3: set ringView.lineWidth from slider and call ringView.setNeedsLayout()
        
        ringView.lineWidth = CGFloat(thicknessSlider.value)
        ringView.setNeedsLayout()
    }

    @objc private func onChange(_ s: UISlider) {
        // TODO-4: update ringView.lineWidth, then ringView.setNeedsLayout()
        ringView.lineWidth = CGFloat(s.value)
        ringView.setNeedsLayout()
    }

    // MARK: - Helper (kept inside the controller)
    private final class CircularRingView: UIView {
        private let shape = CAShapeLayer()
        var lineWidth: CGFloat = 10

        override init(frame: CGRect) {
            super.init(frame: frame)
            isOpaque = false
            shape.fillColor = UIColor.clear.cgColor
            shape.strokeColor = UIColor.systemBlue.cgColor
            layer.addSublayer(shape)
        }
        required init?(coder: NSCoder) { fatalError() }

        override func layoutSubviews() {
            super.layoutSubviews()
            // TODO-5: update shape.frame, shape.lineWidth, and shape.path using bounds & lineWidth
            // tip: let inset = lineWidth / 2; path = UIBezierPath(ovalIn: bounds.insetBy(dx: inset, dy: inset))
            shape.frame = bounds
            shape.lineWidth = lineWidth
            let inset = lineWidth / 2
            let path = UIBezierPath(ovalIn: bounds.insetBy(dx: inset, dy: inset))
            shape.path = path.cgPath
        }
    }
}
