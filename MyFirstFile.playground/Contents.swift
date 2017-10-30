

/*import Foundation
/*print(total)
print ("Hello,User! Please, input your name:")
if let yourName = readLine(){
        print("Hello, \(yourName)")
}*/
let goods = ["Banana" : 32,"Lemon" : 60, "Cerrot": 12]
func custumerPeymentAbility(product:String, cash: Int){
    for (good,cost) in goods{
        if(good == product){
            print(good,cost)
        }
    }
}

func custumer(name: String, check: Double){
    print("Hello, \(name)! \n Your check is:\(check)")
}

if let s = readLine(){
    print("Your choose is: \(s)")
}
var money = 250
custumer(name: "Pablo", check: 250.0)
custumerPeymentAbility(product:"Banana", cash:money)
*/

/*
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int){ //-> Bool {
    if(number < 10){
        func
        return number;
    }
    //return number < 10
}
var numbers = [20, 19, 7, 12]
//hasAnyMatches(list: numbers, condition: lessThanTen)
var namber = lessThanTen;
*/

/*
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


class Furm{
    var farmAnimals = [
        "Horses" : 20,
        "Hens": 100,
        "Sheeps": 10,
        "Pigs": 15,
        "Dackes": 50,
        "Cowes": 12
    ]
    var largest: Int = 0
    age(name: farmAnimals, year: farmAnimals)
    func age(name: String, year: Int){
        print(name)
}
*/

/*struct Person {
    var clothes: String
    var shoes: String
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)*/
//import UIKit
//
//var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
//print(songs[0])
//print(songs[1])
//print(songs[2])
//
//var person = [
//    "first": "Taylor",
//    "middle": "Alison",
//    "last": "Swift",
//    "month": "December",
//    "website": "taylorswift.com"
//]
//
//person["middle"]
//person["month"]
//let scores = [80, 100, 85, 95]
//let formatted = scores.map{"Your score was \($0)"}
//print(formatted)
//var passOrFail = scores.map{$0 > 85 ? "Pass" : "Fail" }
//print(passOrFail)
//let numbers:[Double] = [49, 36, 25, 4, 9, 64, 81, 100]
//let result = numbers.map(sqrt)
//print(result)
//struct Pokemon{
//    var name:String
//    var type: String
//}
//let jakiro = Pokemon(name: "Jakiro", type: "Magikal")
/*import UIKit
struct Person{
    var name: String
    var age: Int
    var surname: String
    var sport: [String]
    var languages: [String]
}

var group = [Person]()
group.append(Person(name: "Paul", age: 18, surname: "Nicson", sport: ["swimming", "football", "valley"], languages: ["english", "spanish"]))
group.append(Person(name: "Helen", age: 17, surname: "Jenkins", sport: ["pilates", "dancing"], languages: ["german","chech"]))
group.append(Person(name: "Felix", age: 19, surname: "Fantana", sport: ["cibersport","ski"], languages: ["french"]))
group.append(Person(name: "Regina", age: 20, surname: "Katalina", sport: [], languages: ["english", "german", "french", "chech"]))

func langSum(group:[Person]){
    var lang: String = "english"
    for person in group{
        for l in person.languages{
            if(l == lang) && (person.age > 19){
                print(person.name)
            }
        }
    }
}
langSum(group: group)
class Animal:Person{
    
}*/
var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333








