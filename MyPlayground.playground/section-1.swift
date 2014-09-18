// Playground - noun: a place where people can play

import UIKit
import Transit

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
myGen.next()
myGen.next()
myGen.next()
myGen.next()
myGen.next()
myGen.next()


let arr = [1, 2, 3, 4, 5]

let truthiness = true && false

//let newSet = mySet + ["a", "b", "c", "d", "qux"]

mySet.addElements(["a", "b", "c", "qux", "yeah"])

mySet.intersects(Set(sequence: ["a", "what", "yeah"]))

mySet.intersect(Set(sequence: ["a", "what", "yeah"]))

mySet.allElements

mySet.intersects(Set(sequence: ["okay", "what", "yeah"]))

mySet.allElements

let secondSet = Set(sequence: ["what", "okay", "yeah"])

let otherSet = mySet + secondSet

otherSet.allElements

arr.debugDescription
arr.description

