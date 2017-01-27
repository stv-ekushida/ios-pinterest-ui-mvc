//
//  PhotoDataSource.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoDataSource {
    
    static let fileName = "photos"
    static let fileType = "plist"
    
    struct keys {
        static let caption = "caption"
        static let comment = "comment"
        static let image = "image"
    }
    
    static func loadPhotos() -> [Photo] {
        
        var result = [Photo]()
        
        guard let filePath =  Bundle.main.path(forResource: fileName, ofType: fileType) else {
            return result
        }
        
        guard let contentsOfFile = NSDictionary(contentsOfFile: filePath) else {
            return result
        }
        
        let photos = contentsOfFile.object(forKey: fileName) as! NSArray
        
        photos.forEach {
            
            guard let dic = $0 as? NSDictionary else {
                return
            }
            
            var photo = Photo()
            photo.caption = dic.object(forKey: keys.caption) as? String ?? ""
            photo.comment = dic.object(forKey: keys.comment) as? String ?? ""
            photo.image = UIImage(
                named: dic.object(forKey: keys.image) as? String ?? "")
            result.append(photo)
        }
        return result
    }
}
