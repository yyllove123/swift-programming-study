// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let aaa = 123

let bbb: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let widthLabelOther = "The height is \(width * 2)"

let optionalString: String? = "Hello"
optionalString == nil

var optionName: String? = nil
var greeting = "Hello!"
if let name = optionName {
    greeting = "Hello, \(name)"
}


var numbers = [20, 19, 7, 12]

var abc = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
abc
numbers

let sortedNumbers = sorted(numbers) {$0 > $1}
sortedNumbers

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    let height: Int = 99
    func simpleHeight(heght: Int) -> String {
        return "A shape with \(heght) height!"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapDeshhh = shape.simpleHeight(999)


enum Rank : Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Queen
let aceRawValue = ace.rawValue
let aceDescription = ace.simpleDescription()

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit
{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String
    {
        switch self
        {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
//let heartsRawValue = hearts.rawValue
let heartsDescription = hearts.simpleDescription()

struct Card
{
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse
{
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 AM", "8:09 PM")
let failure = ServerResponse.Error("Out of cheese")

//switch success
//{
//case let .Result(sunrist, sunset):
//    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
//case let .Error(error):
//    let serverResponse = "Failure... \(error)"
//}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass : ExampleProtocol
{
    let abc :Int = 123
    var simpleDescription : String = "A very simple class."
    var anotherProperty : Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription;

struct SimpleStructure : ExampleProtocol
{
    var simpleDescription : String = "A simple structure"
    mutating func adjust()
    {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int : ExampleProtocol {
    var simpleDescription : String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription

let protocolValue : ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.abc

func repeat<Item>(item: Item, times: Int) -> [Item]
{
    var result = [Item]()
    for i in 0..<times
    {
        result.append(item)
    }
    return result
}

repeat("knock", 4)















