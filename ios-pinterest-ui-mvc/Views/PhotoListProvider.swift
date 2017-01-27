//
//  PhotoListProvider.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoListProvider: NSObject, UICollectionViewDataSource {
    
    var photos: [Photo] = []
    
    func add(photos: [Photo]) {
        self.photos = photos
    }
    
    func findByIndex(index: Int) -> Photo{
        return self.photos[index]
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoListCell.identifier,
                                                      for: indexPath) as! PhotoListCell
        cell.photo = photos[indexPath.row]
        return cell
    }
}
