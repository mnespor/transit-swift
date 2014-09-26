//
//  Link.swift
//  Transit
//
//  Created by Matthew Nespor on 9/25/14.
//
//

import Foundation

public struct Link : Hashable
{
    public let URI: NSURL
    public let rel: String
    public let name: String?
    public let prompt: String?
    public let render: String?
    
    public enum Render: String {
        case Image = "image"
        case Link = "link"
    }
    
    public var hashValue: Int {
        get {
            if var fullDescription = URI.absoluteString {
                fullDescription = fullDescription + rel
                if let n = name { fullDescription += n }
                if let p = prompt { fullDescription += p }
                if let r = render { fullDescription += r }
                return fullDescription.hashValue
            }
            else {
                var fullDescription = rel
                if let n = name { fullDescription += n }
                if let p = prompt { fullDescription += p }
                if let r = render { fullDescription += r }
                return fullDescription.hashValue
            }
        }
    }
    
    public init(uri: NSURL, rel: String, name: String?, prompt: String?, render: Render?) {
        self.URI = uri
        self.rel = rel
        self.name = name
        self.prompt = prompt
        self.render = render?.toRaw()
    }
}

public func == (lhs: Link, rhs: Link) -> Bool {
    return lhs.URI.isEqual(rhs.URI) && lhs.rel == rhs.rel && lhs.name == rhs.name && lhs.prompt == rhs.prompt && lhs.render == rhs.render
}

public func != (lhs: Link, rhs: Link) -> Bool {
    return !(lhs == rhs)
}