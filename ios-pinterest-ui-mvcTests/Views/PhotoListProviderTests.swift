//
//  PhotoListProviderTests.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_pinterest_ui_mvc

class PhotoListProviderTests: XCTestCase {
    
    var provider: PhotoListProvider!
    var collectionView: UICollectionView!
    var controller: PhotoListViewController!

    override func setUp() {
        super.setUp()
        
        provider = PhotoListProvider()
        
        let storyboard = UIStoryboard(name: "PhotoList", bundle: nil)
        controller = storyboard.instantiateViewController(
            withIdentifier: "PhotoListViewController") as! PhotoListViewController
        
        _ = controller.view
        
        collectionView = controller.photoListCollectionView
        collectionView.dataSource = provider
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_NumberOfSections_IsOne() {
        let numberOfSections = collectionView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_NumberOfRows_inFirstSection_IsOne() {
        
        let photo = Photo(caption: "1", comment: "1", image: nil)
        provider.add(photos: [photo])
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 1)
    }
    
    func test_NumberOfRows_inFirstSection_IsTwo() {
        
        let photo1 = Photo(caption: "1", comment: "1", image: nil)
        let photo2 = Photo(caption: "2", comment: "2", image: nil)
        provider.add(photos: [photo1, photo2])
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2)
    }
}
