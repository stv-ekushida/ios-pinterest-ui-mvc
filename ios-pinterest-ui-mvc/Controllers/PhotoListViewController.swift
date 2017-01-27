//
//  PhotoListViewController.swift
//  pinterest-like-ui
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoListViewController: UIViewController {

    @IBOutlet weak var photoListCollectionView: UICollectionView!
    let dataSource = PhotoListProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPhotos()
    }

    private func setup() {
        
        photoListCollectionView.backgroundColor = UIColor.clear
        photoListCollectionView.dataSource = dataSource
        
        if let layout = photoListCollectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = dataSource
        }
    }
    
    private func loadPhotos() {

        let photos = PhotoDataSource.loadPhotos()
        dataSource.add(photos: photos)
    }
}
