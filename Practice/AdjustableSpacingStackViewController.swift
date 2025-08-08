//
//  AdjustableSpacingStackViewController.swift
//  Practice
//
//  Created by Kateryna on 08/08/2025.
//

import UIKit

final class AdjustableSpacingStackViewController: UIViewController {

    private let container = ManualHStackView()
    private let spacingSlider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        spacingSlider.minimumValue = 0
        spacingSlider.maximumValue = 40
        spacingSlider.value = 20
        spacingSlider.addTarget(self, action: #selector(onChange(_:)), for: .valueChanged)

        // TODO-1: add container & slider; container height 100, side insets 24, centerY
        view.addSubview(container)
        view.addSubview(spacingSlider)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        spacingSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 100),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            spacingSlider.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 24),
            spacingSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            spacingSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        // TODO-2: place slider below container, matching side insets
        // TODO-3: set container.spacing from slider and call setNeedsLayout()
        
        container.spacing = CGFloat(spacingSlider.value)
        container.setNeedsLayout()
    }

    @objc private func onChange(_ s: UISlider) {
        container.spacing = CGFloat(spacingSlider.value)
        container.setNeedsLayout()    }

    // MARK: - Helper view
    private final class ManualHStackView: UIView {
        var spacing: CGFloat = 12 { didSet { setNeedsLayout() } }
        private let views = [UIView(), UIView(), UIView()]

        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .secondarySystemBackground
            views.enumerated().forEach { idx, v in
                v.layer.cornerRadius = 10
                v.backgroundColor = [UIColor.systemPink, .systemTeal, .systemIndigo][idx]
                addSubview(v)
            }
        }
        required init?(coder: NSCoder) { fatalError() }

        override func layoutSubviews() {
            super.layoutSubviews()
            // TODO-5: compute equal widths with `spacing` gaps and set frames aligned to full height
            
            let totalSpaceing = spacing * 2
            let width = (bounds.width - totalSpaceing) / 3
            let height = bounds.height
            
            views[0].frame = CGRect(x: 0, y: 0, width: width, height: height)
            views[1].frame = CGRect(x: (width + spacing), y: 0, width: width, height: height)
            views[2].frame = CGRect(x: (width + spacing) * 2, y: 0, width: width, height: height)
        }
    }
}
