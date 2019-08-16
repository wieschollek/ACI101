//
//  MinutesTests2.swift
//  MinutesTests2
//
//  Created by Martin Wieschollek on 16.08.19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes


class MinutesTests2: XCTestCase {

    var entryUnderTest: Entry!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp();
        entryUnderTest = Entry("Title", "Content");
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTest = nil;
        super.tearDown();
    }

   func testSerialize()
   {
    let serializeData = FileEntryStore.serialize(entryUnderTest);
    let entry = FileEntryStore.deserialize(serializeData!);
    
    XCTAssertEqual(entry?.title, "Title", "Title does not match");
    XCTAssertEqual(entry?.content, "Content", "Content does not match");
   }

}
