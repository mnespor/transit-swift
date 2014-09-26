//
//  Keyword.swift
//  Transit
//
//  Created by Matthew Nespor on 9/25/14.
//
//

import Foundation

public struct Keyword : Hashable
{
    public let namespace: String?
    public let name: String

    public var hashValue: Int {
        get {
            return 17 * self.stringValue.hashValue
        }
    }

    public var stringValue: String {
        get {
            if var ns = namespace {
                return ns + "/" + name
            }
            else {
                return name
            }
        }
    }
    
    public init(keyword: String) {
        if let range = keyword.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "/")) {
            namespace = keyword.substringToIndex(range.startIndex)
            name = keyword.substringFromIndex(range.endIndex)
        }
        else {
            name = keyword
        }
    }
}

public func == (lhs: Keyword, rhs: Keyword) -> Bool {
    return lhs.stringValue == rhs.stringValue
}

public func != (lhs: Keyword, rhs: Keyword) -> Bool {
    return lhs.stringValue != rhs.stringValue
}