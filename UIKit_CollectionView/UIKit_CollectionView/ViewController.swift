//
//  ViewController.swift
//  UIKit_CollectionView
//
//  Created by 강창현 on 2/13/24.
//

import UIKit

final class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: flowLayout
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .blue
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyCell.identifier,
                for: indexPath
            ) as? MyCell
        else {
            return MyCell()
        }
        cell.configure(text: indexPath.row.description)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

final class MyCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    private var titleLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configure(text: "")
    }
    
    func configure(text: String) {
        self.backgroundColor = .brown
        titleLabel.text = text
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        self.contentView.addSubview(titleLabel)
        titleLabel.frame = self.bounds
    }
}
