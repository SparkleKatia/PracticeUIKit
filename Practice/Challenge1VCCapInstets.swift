//
//  Challenge1VCCapInstets.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

class Challenge1VCCapInstets: UIViewController {

    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // MARK: – Button set-up
        button.setTitle("Download", for: .normal)
        let cap = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        let stretchable = UIImage(named: "button")!.resizableImage(withCapInsets: cap, resizingMode: .stretch)

        
        button.setBackgroundImage(stretchable, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)

        // TODO-1: create a 24×24 green image with 12-pt corner radius
        // TODO-2: define capInsets so *all* 12-pt corners never stretch
        // TODO-3: set that image as button.setBackgroundImage(_, for: .normal)

        // Layout
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension UIImage {

    /// Returns a version of the receiver that will keep its rounded
    /// corners rigid and stretch only the centre 1-pt strip.
    /// - parameter cornerRadius: Corner radius in points (12 in your case).
    func stretchableKeeping(cornerRadius: CGFloat) -> UIImage {

        // 1.  If the bitmap is *too small*, pad it with transparent pixels.
        let needsPadding =
            size.width  < cornerRadius * 2 + 1 ||
            size.height < cornerRadius * 2 + 1

        let baseImage: UIImage = {
            guard needsPadding else { return self }

            let padW = max(0, cornerRadius * 2 + 1 - size.width)  / 2
            let padH = max(0, cornerRadius * 2 + 1 - size.height) / 2
            let newSize = CGSize(width: size.width  + padW * 2,
                                 height: size.height + padH * 2)

            let renderer = UIGraphicsImageRenderer(size: newSize)
            return renderer.image { _ in
                self.draw(at: CGPoint(x: padW, y: padH))
            }
        }()

        // 2.  Build cap-insets that lock down the corners.
        let insets = UIEdgeInsets(top:    cornerRadius,
                                  left:   cornerRadius,
                                  bottom: cornerRadius,
                                  right:  cornerRadius)

        // 3.  And hand UIKit a proper 9-slice image.
        return baseImage.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
}
