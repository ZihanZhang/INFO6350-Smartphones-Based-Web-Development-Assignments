//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//*********************************************************************
print("Swift Variables")

var Vquestion1: Int = 15

var Vquestion2: Int = 5

var Vquestion3: Int = Vquestion1 + Vquestion2

var Vquestion4: Int = Vquestion1 * Vquestion2

var Vquestion5: Int = Vquestion1 - Vquestion2

var Vquestion6: Int = Vquestion1 / Vquestion2

var Vquestion7: String = "Hello"

var Vquestion8: String = "World"

var Vquestion9: String = Vquestion7 + Vquestion8

//*********************************************************************
print("Swift Functions")

func add(first: Double, second: Double) -> Double{
    return first + second
}

func subtract(first: Int, second: Int) -> Int {
    return first - second
}

func multiply(first: Float, second: Float) -> Float {
    return first * second
}

add(first: 1.0, second: 5.0)

subtract(first: 5, second: 1)

multiply(first: 2.0, second: 5.0)

//********************************************************************
print("Swift Arrays")

var emptyArray: [String] = []

var doubleArray: [Double] = [1.0, 2.0, 3.0, 4.0]

var anyTypeArray = [1, 2, 3, 4, 5]

emptyArray.append("a")
emptyArray.append("b")
emptyArray.append("c")

doubleArray.append(5.0)
doubleArray.append(6.0)
doubleArray.append(7.0)

anyTypeArray.append(6)
anyTypeArray.append(7)
anyTypeArray.append(8)

emptyArray.remove(at: 2)
doubleArray.remove(at: 3)
anyTypeArray.remove(at: 4)

anyTypeArray.remove(at: Int(arc4random_uniform(UInt32(anyTypeArray.count))))

doubleArray.removeAll()

//*******************************************************************
print("Swift Loop")

var oddNumbers: [Int] = []

for odd in 1...100 {
    oddNumbers.append(odd)
}

var sums: [Int] = []

for odd in oddNumbers {
    sums.append(odd + 5)
}

var count = 0
repeat {
    print("The sum is: \(sums[count])")
    count += 1
}while count < sums.count

//********************************************************************
print("Swift Condition")

func fridge(milkAge: Int, eggsAge: Int) {
    if milkAge <= 21 {
        if eggsAge <= 10 {
            print("you can still use your milk and eggs")
        }
        else {
            print("you should throw away the eggs")
        }
    }
    else {
        if eggsAge <= 10 {
            print("you should throw away the milk")
        }
        else {
            print("you should throw away the milk and eggs")
        }
    }
}

func identifier(first: Int, second: Int, third: Int) {
    if first != second {
        if second != third {
            if third != first {
                print("the values are different")
                return
            }
        }
    }
    print("two values are at least identical")
}

//*******************************************************************
print("Swift Dictionaries")

var dictionaryArray: [[String: String]] = []

var dictionary = [String: String]()

dictionary["firstName"] = "Zihan1"
dictionary["lastName"] = "Zhang1"
dictionaryArray.append(dictionary)

dictionary["firstName"] = "Zihan2"
dictionary["lastName"] = "Zhang2"
dictionaryArray.append(dictionary)

dictionary["firstName"] = "Zihan3"
dictionary["lastName"] = "Zhang3"
dictionaryArray.append(dictionary)

var result1: [String] = []

for onedictionary in dictionaryArray {
    if var presult = onedictionary["firstName"] {
        result1.append(presult)
    }
}

var result2: [String] = []

for onedictionary in dictionaryArray {
    if var firstName = onedictionary["firstName"], var lastName = onedictionary["lastName"] {
        result2.append(firstName + "*" + lastName)
    }
}

//*******************************************************************
print("Swift Tuple - Enum")

enum CoinType: Int{
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
    case HalfDollar = 50
    case Dollar = 100
}

var money: [(Int, CoinType)] = [(4, .Penny), (3, .Nickel), (5, .Dime), (9, .Quarter), (3, .HalfDollar), (1, .Dollar)]

var total: Int = 0

for (num, value) in money {
    total += num * value.rawValue
}

print(total)


