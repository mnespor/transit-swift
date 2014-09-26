//
//  Symbol.swift
//  Transit
//
//  Created by Matthew Nespor on 9/25/14.
//
//

import Foundation

public struct Symbol : Hashable
{
    public let namespace: String?
    public let name: String
    
    public var hashValue: Int {
        get {
            return 19 * self.stringValue.hashValue
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
    
    public init(symbol: String) {
        if let range = symbol.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "/")) {
            namespace = symbol.substringToIndex(range.startIndex)
            name = symbol.substringFromIndex(range.endIndex)
        }
        else {
            name = symbol
        }
    }
}

public func == (lhs: Symbol, rhs: Symbol) -> Bool {
    return lhs.stringValue == rhs.stringValue
}

public func != (lhs: Symbol, rhs: Symbol) -> Bool {
    return lhs.stringValue != rhs.stringValue
}