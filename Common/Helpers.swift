//
//  Helpers.swift
//  Transit
//
//  Created by Matthew Nespor on 9/25/14.
//
//

import Foundation

public func hashCombine(seed: Int, hash: Int) -> Int {
    //a la boost
    return seed ^ hash + 0x9e3779b9 + (seed << 6) + (seed >> 2);
}

