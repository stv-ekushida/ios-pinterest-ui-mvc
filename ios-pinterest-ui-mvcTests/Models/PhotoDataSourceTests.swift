//
//  PhotoDataSourceTests.swift
//  ios-pinterest-ui-mvc
//
//  Created by Eiji Kushida on 2017/01/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_pinterest_ui_mvc

class PhotoDataSourceTests: XCTestCase {
    
    var photos: [Photo] = []
    
    override func setUp() {
        super.setUp()        
        photos = PhotoDataSource.loadPhotos()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHasPhotos() {
        XCTAssertNotNil(photos)
    }
    
    func testPhotoCount() {
        XCTAssertEqual(photos.count, 10)
    }
    
    func testFirstItem() {
        
        let photo = photos.first

        XCTAssertEqual(photo?.caption, "リス")
        XCTAssertEqual(photo?.comment, "リス（栗鼠）は、ネズミ目(齧歯目)リス科に属する動物の総称である。")
        XCTAssertNotNil(photo?.image)
    }
    
    func testLastItem() {
        let photo = photos.last
        
        XCTAssertEqual(photo?.caption, "ペンギン")
        XCTAssertEqual(photo?.comment, "ペンギン (英語: penguin [ˈpɛŋgwɪn]) は、鳥類ペンギン目（学名 Sphenisciformes）に属する種の総称である。ペンギン科（学名 Spheniscidae）のみが現生する。\n主に南半球に生息する海鳥であり、飛ぶことができない。\n今では使われることは稀だが、「人鳥（じんちょう）」「企鵝（きが、企は爪先立つの意、鵝はガチョウ）」という和名もある。")
        XCTAssertNotNil(photo?.image)
        
    }
}
