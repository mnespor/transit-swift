//
//  Set.swift
//  Transit
//
//  Created by Matthew Nespor on 9/16/14.
//
//

import Foundation

public struct Set<T : Hashable> : SequenceType
{
    private var buckets = [Int : [T]]()
    public var count: Int {
        get {
            return self.allElements.count
        }
    }
    
    public var allElements: Array<T> {
        get {
            var result = Array<T>()
            result.reserveCapacity(buckets.count)
            for (key, bucket) in buckets
            {
                result += bucket
            }
            return result
        }
    }
    
    public var anyElement: T? {
        var gen = self.generate()
        return gen.next()
    }
    
    public init() {
    }
    
    public init<S: SequenceType where S.Generator.Element == T>(sequence: S) {
        self.addElements(sequence)
    }
    
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
    
    public mutating func addElement(newElement:T) {
        if !self.contains(newElement) {
            let hash = newElement.hashValue
            if buckets[hash] != nil {
                buckets[hash]?.append(newElement)
            }
            else {
                buckets[hash] = [newElement]
            }
        }
    }
    
    public mutating func addElements<S: SequenceType where S.Generator.Element == T> (sequence: S) {
        for element in [T](sequence) {
            self.addElement(element)
        }
    }
    
    public mutating func remove(element:T) {
        let hash = element.hashValue
            for var idx = 0; idx < buckets[hash]?.count; idx++ {
                if buckets[hash]?[idx] == element {
                    buckets[hash]?.removeAtIndex(idx)
                    break
                }
            }
    }
    
    public func isSubsetOf(set:Set<T>) -> Bool {
        for element in self {
            if !set.contains(element) {
                return false
            }
        }
        
        return true
    }
    
    public func intersects(set:Set<T>) -> Bool {
        for element in self {
            if set.contains(element) {
                return true
            }
        }
        
        return false
    }
    
    // MARK: - SequenceType
    
    public func generate () -> GeneratorOf<T> {
        var gen = SetGenerator(set: self)
        return GeneratorOf() {
            gen.next()
        }
    }
}

struct SetGenerator<T : Hashable> : GeneratorType
{
    var bucketsGenerator : DictionaryGenerator<Int, [T]>
    var bucketGenerator : IndexingGenerator<[T]>?
    
    init (set:Set<T>) {
        bucketsGenerator = set.buckets.generate()
    }
    
    mutating func next() -> T? {
        if let result = bucketGenerator?.next() {
            return result
        }
        
        while let (key, bucket) = bucketsGenerator.next() {
            bucketGenerator = bucket.generate()
            if let result = bucketGenerator?.next() {
                return result
            }
        }
        
        return nil
    }
}

// MARK: - Equatable

public func ==<T:Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isSubsetOf(rhs) && rhs.isSubsetOf(lhs)
}

public func !=<T:Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return !lhs.isSubsetOf(rhs) || !rhs.isSubsetOf(lhs)
}

// MARK: Union operations

public func +<S: SequenceType> (set: Set<S.Generator.Element>, sequence: S) -> Set<S.Generator.Element> {
    var result = set
    result.addElements(sequence)
    return result
}

