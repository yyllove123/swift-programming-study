//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    println(runningTotal)
    
    return incrementor
}

let ma = makeIncrementor(forIncrement: 2)
var mavalue = ma()
ma()
ma()