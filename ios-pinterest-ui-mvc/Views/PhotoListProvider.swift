//
//  PhotoListProvider.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import AVFoundation

final class PhotoListProvider: NSObject, UICollectionViewDataSource {
    
    var photos: [Photo] = []
    
    func add(photos: [Photo]) {
        self.photos = photos
    }
    
    func findByIndex(index: Int) -> Photo{
        return photos[index]
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


//MARK:- PinterestLayoutDelegate
extension PhotoListProvider: PinterestLayoutDelegate {
    
    struct FontSize {
        static let caption = CGFloat(13)
        static let comment = CGFloat(11)
    }
    
    struct Padding {
        static let height = CGFloat(16)
    }
    
    func collectionView(_ collectionView:UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath ,
                        withWidth width:CGFloat) -> CGFloat {
        
        let boundingRect = CGRect(x: 0, y: 0,
                                  width: width,
                                  height: CGFloat(MAXFLOAT))
        guard let image = photos[indexPath.row].image else{
            return CGFloat(0)
        }
        
        let rect = AVMakeRect(aspectRatio: image.size,
                              insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForCaptionAndCommentAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        
        let photo = photos[(indexPath as NSIndexPath).item]
        
        let captionrHeight = photo.heightForCaption(
            UIFont.systemFont(ofSize: FontSize.caption), width: width)
        let commentHeight = photo.heightForComment(
            UIFont.systemFont(ofSize: FontSize.comment), width: width)
        
        return Padding.height + captionrHeight + commentHeight + Padding.height
    }
}
