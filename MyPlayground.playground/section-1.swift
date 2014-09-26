// Playground - noun: a place where people can play

import UIKit
import TransitKit

var str = "Hello, playground"

var mySet = Set<String>()

mySet.addElement("bar")
mySet.addElement("bar")
mySet.addElement("bar")
mySet.addElement("foo")
mySet.addElement("qux")
mySet.addElement("baz")
mySet.addElement("quuuux")

mySet.allElements

mySet.remove("foo")

mySet.allElements

mySet.remove("foo")

mySet.allElements

mySet.contains("foo")
mySet.contains("bleh")

mySet.count

var myGen = mySet.generate()
myGen.next()!
myGen.next()
myGen.next()
myGen.next()
myGen.next()
myGen.next()


let arr = [1, 2, 3, 4, 5]

let truthiness = true && false

mySet.addElements(["a", "b", "c", "qux", "yeah"])

mySet.intersects(Set(sequence: ["a", "what", "yeah"]))

mySet.intersect(Set(sequence: ["a", "what", "yeah"]))

mySet.allElements

mySet.intersects(Set(sequence: ["okay", "what", "yeah"]))

mySet.allElements

let secondSet = Set(sequence: ["what", "okay", "yeah"])

arr.debugDescription
arr.description

let bleh = NSDate.date()
let blah = 5.0

let kw = "myns/mykeyword"
let r = kw.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "/"))!
let ns = kw.substringToIndex(r.startIndex)
let name = kw.substringFromIndex(r.endIndex)
let c = countElements(name)

let first = Set(sequence: ["foo", "bar", "baz", "qux"])
let second = Set(sequence: ["bar", "qux", "baz", "foo"])

let iseq = first == second
let firsta = first.allElements
let seconda = second.allElements

let myseth = mySet.hashValue
let firsth = first.hashValue
let secondh = second.hashValue

func bleh (x: Int, y: Int) -> Int {
    return x ^ y
}

bleh (1, 0)
