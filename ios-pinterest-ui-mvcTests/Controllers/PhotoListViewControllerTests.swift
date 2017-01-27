//
//  PhotoListViewControllerTests.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_pinterest_ui_mvc

class PhotoListViewControllerTests: XCTestCase {
    
    var sut: PhotoListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "PhotoList",
                                      bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "PhotoListViewController")
            as! PhotoListViewController
        
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_PhotoListCollectionView_IsNotNil() {
        XCTAssertNotNil(sut.photoListCollectionView)
    }

    func test_PhotoListDataSource() {
        XCTAssertTrue(sut.photoListCollectionView.dataSource is PhotoListProvider)
    }    
}
