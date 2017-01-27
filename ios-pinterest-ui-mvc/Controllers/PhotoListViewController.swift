//
//  PhotoListViewController.swift
//  pinterest-like-ui
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit
import AVFoundation

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
            layout.delegate = self
        }
    }
    
    private func loadPhotos() {
        let photos = PhotoDataSource.loadPhotos()
        dataSource.add(photos: photos)
    }
}

//MARK:- PinterestLayoutDelegate
extension PhotoListViewController: PinterestLayoutDelegate {
    
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
        
        let photo = dataSource.findByIndex(index: indexPath.row)
        let boundingRect = CGRect(x: 0, y: 0,
                                  width: width,
                                  height: CGFloat(MAXFLOAT))
        guard let image = photo.image else{
            return CGFloat(0)
        }
        
        let rect = AVMakeRect(aspectRatio: image.size,
                              insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForCaptionAndCommentAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        
        let photo = dataSource.findByIndex(
            index: (indexPath as NSIndexPath).item)
        
        let captionrHeight = photo.heightForCaption(
            UIFont.systemFont(ofSize: FontSize.caption), width: width)
        let commentHeight = photo.heightForComment(
            UIFont.systemFont(ofSize: FontSize.comment), width: width)
        
        return Padding.height + captionrHeight + commentHeight + Padding.height
    }
}
