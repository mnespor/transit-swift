//
//  Reader.swift
//  Transit
//
//  Created by Matthew Nespor on 9/16/14.
//
//

import Foundation

public class Reader: NSObject {
    internal var inputStream:NSInputStream
    
    init(inputStream:NSInputStream)
    {
        self.inputStream = inputStream
    }
    
    class func reader(format:Format, inputStream:NSInputStream) -> Reader
    {
        var result:Reader
        switch format {
        case .JSON,
        .JSONVerbose:
            result = JSONReader(inputStream: inputStream)
        case .MessagePack:
            result = MessagePackReader(inputStream: inputStream)
        }
        return result
    }
    
    
}

class JSONReader: Reader {
    override init(inputStream: NSInputStream) {
        super.init(inputStream: inputStream)
    }
}

class MessagePackReader: Reader {
    override init(inputStream: NSInputStream) {
        super.init(inputStream: inputStream)
    }
}