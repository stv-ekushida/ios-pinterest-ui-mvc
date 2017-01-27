//
//  Photo.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

struct Photo {
    var caption = ""
    var comment = ""
    var image: UIImage?
    
    func heightForCaption(_ font: UIFont, width: CGFloat) -> CGFloat {
        
        let rect = NSString(string: caption).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(rect.height)
    }
    
    func heightForComment(_ font: UIFont, width: CGFloat) -> CGFloat {
        
        let rect = NSString(string: comment).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(rect.height)
    }
}
