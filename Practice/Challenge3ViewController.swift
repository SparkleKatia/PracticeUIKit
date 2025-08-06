//
//  Challenge3ViewController.swift
//  Practice
//
//  Created by Kateryna on 06/08/2025.
//

import UIKit

class Challenge3ViewController: UIViewController, UICollectionViewDataSource {

    private lazy var layout: UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
        l.itemSize = CGSize(width: 100, height: 100)
        l.minimumInteritemSpacing = 8
        l.minimumLineSpacing = 8
        l.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        // TODO-1: set minimumInteritemSpacing / minimumLineSpacing = 8
        // TODO-2: set sectionInset = UIEdgeInsets(20 on all sides)
        return l
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .systemGroupedBackground
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: – DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 30 }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemTeal
        return cell
    }
}
