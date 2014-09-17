//
//  Set.swift
//  Transit
//
//  Created by Matthew Nespor on 9/16/14.
//
//

import Foundation

public struct Set<T : Hashable>
{
    private var buckets = [Int : [T]]()
    
    public func contains(element:T) -> Bool {
        if let bucket = buckets[element.hashValue] {
            for candidate in bucket {
                if (candidate == element) {
                    return true
                }
            }
        }
        return false
    }
    
    public mutating func add(newElement:T) {
        if !self.contains(newElement) {
            if var bucket = buckets[newElement.hashValue] {
                bucket.append(newElement)
            }
            else {
                buckets[newElement.hashValue] = [newElement]
            }
        }
    }
    
    public mutating func remove(element:T) {
        if var bucket = buckets[element.hashValue] {
            for var idx = 0; idx < bucket.count; idx++ {
                if bucket[idx] == element {
                    bucket.removeAtIndex(idx)
                    break
                }
            }
        }
    }
    
}