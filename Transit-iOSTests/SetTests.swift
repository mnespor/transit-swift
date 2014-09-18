//
//  SetTests.swift
//  Transit
//
//  Created by Matthew Nespor on 9/17/14.
//
//

import UIKit
import XCTest
import Transit

class SetTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitAndCount() {
        let empty = Set<String>()
        XCTAssert(empty.count == 0)
        let full = Set(sequence: ["a", "b", "c", "d", "e"])
        XCTAssert(full.count == 5)
        let collidey = Set(sequence: ["a", "a", "a", "b", "b", "c"])
        XCTAssert(collidey.count == 3)
    }
    
    func testAllElements() {
        let s = Set(sequence: ["a", "b", "c"])
        let all = s.allElements
        XCTAssert(all.count == 3)
    }
    
    func testAdd() {
        var s = Set<String>()
        s.addElement("a")
        s.addElement("b")
        XCTAssert(s.count == 2)
        s.addElement("a")
        XCTAssert(s.count == 2)
        s.addElements(["b", "c", "d"])
        XCTAssert(s.count == 4)
    }
    
    func testContains() {
        let s = Set(sequence: ["a", "b", "c"])
        XCTAssert(s.contains("a"))
    }
    
    func testAnyElement() {
        let s = Set(sequence: ["a", "b", "c"])
        XCTAssert(s.contains(s.anyElement!))
    }
    
    func testRemove () {
        var s = Set(sequence: ["a", "b", "c", "d", "e"])
        s.remove("a")
        XCTAssertFalse(s.contains("a"))
        s.removeElements(["c", "d"])
        XCTAssertFalse(s.contains("c"))
        XCTAssertFalse(s.contains("d"))
        XCTAssert(s.count == 2)
        s.removeAll()
        XCTAssert(s.count == 0)
    }
    
    func testIntersect () {
        var abc = Set(sequence: ["a", "b", "c"])
        let cde = Set(sequence: ["c", "d", "e"])
        let xyz = Set(sequence: ["x", "y", "z"])
        XCTAssert(abc.intersects(cde))
        XCTAssertFalse(abc.intersects(xyz))
        abc.intersect(cde)
        XCTAssert(abc.count == 1)
        XCTAssert(abc.contains("c"))
    }
    
    func testSubset () {
        let abcde = Set(sequence: ["a", "b", "c", "d", "e"])
        let abc = Set(sequence: ["a", "b", "c"])
        let abf = Set(sequence: ["a", "b", "f"])
        
        XCTAssert(abc.isSubsetOf(abcde))
        XCTAssertFalse(abcde.isSubsetOf(abc))
        XCTAssertFalse(abf.isSubsetOf(abcde))
        XCTAssert(abcde.isSubsetOf(abcde))
    }
    
    func testEquality () {
        let abcde = Set(sequence: ["a", "b", "c", "d", "e"])
        let edcba = Set(sequence: ["e", "d", "c", "b", "a"])
        let abc = Set(sequence: ["a", "b", "c"])
        
        XCTAssert(abcde == edcba)
        XCTAssertFalse(abcde == abc)
        
        XCTAssert(abc != abcde)
        XCTAssertFalse(abcde != edcba)
    }
    
    func testGenerator () {
        let abc = Set(sequence: ["a", "b", "c"])
        var gen = abc.generate()
        XCTAssertNotNil(gen.next())
        XCTAssertNotNil(gen.next())
        XCTAssertNotNil(gen.next())
        XCTAssertNil(gen.next())
    }
}
