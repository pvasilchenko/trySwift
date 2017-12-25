/*
 
var array: [Int?] = [5, 7, nil, 2, 4]
var summ = 0
for i in array{
    if let num = i{
        summ += num
    }
}
print(summ)

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "g",
                    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var reversedAlphabet = [String]()
var upperCaseAlphabet = [String]()
for i in alphabet{
    upperCaseAlphabet.append(i.uppercased())
}
for i in (0..<alphabet.count).reversed(){
    reversedAlphabet.append(alphabet[i])
}
print(reversedAlphabet)
print(upperCaseAlphabet)
*/

/*Dictionary
 
 1. Create dictionary with student's information, where key: student's name, value: test mark
        1.1. Incriase mark for some students
        1.2. Some students left
        1.3. Count mark's summery
        1.4. Count avarage mark
 2. Create dictionary, where key: month, value: amount of days in month
        2.1. print it by tuple
        2.2. print by looping key's array
 3. Create dictionary for chess board, where key: cell coordinate, value: bool.
                                                                    True - white cell
                                                                    False - black cell
 
 */
// 1
/*
import UIKit
import Darwin

var studentMark = ["John": 68, "Erick": 70, "Alen": 95, "Julia": 75, "Ron": 69, "Mary": 78]
for i in studentMark.keys{
    if var mark = studentMark[i]{
        if(mark < 80){
            mark = mark + Int(arc4random_uniform(10))
            studentMark.updateValue(mark, forKey: i)
            if(mark < 75){
                let mark = studentMark.removeValue(forKey: i)
                print("Student \(i) didn't pass exam after rewriting, mark: \(mark!)")
            }
        }
    }
}
var markSum = studentMark.values.reduce(0, +)
var markAvarage = markSum/studentMark.values.count
print(studentMark)

//2
let daysMonthes: [String:Int] = ["january": 31,
                   "fabruary": 28,
                   "march":31,
                   "april":30,
                   "may": 31,
                   "june": 30,
                   "july": 31,
                   "august": 31,
                   "september": 30,
                   "october": 31,
                   "november": 30,
                   "december": 31  ]
//var tuple = [(month: String, day: Int)]()
var tuple: (month: String, day: Int)
for i in daysMonthes.keys{
    if let days = daysMonthes[i]{
        tuple.day = days
        tuple.month = i
        print(tuple)
        //tuple.append((month: i, day: days))
        
    }
}
var x = 7
var y = "a"
var cellColor = [String:Bool]()
let cellY = ["a", "b", "c", "d", "e", "f", "g", "h"]
let cellX = [1, 2, 3, 4, 5, 6, 7, 8]
for xVal in cellX{
    for (index, charact) in cellY.enumerated(){
        if(xVal % 2 == index + 1 % 2){
            cellColor.updateValue(false, forKey: "\(xVal)\(charact)")
        }else{
            cellColor.updateValue(true, forKey: "\(xVal)\(charact)")
        }
    }
}
print(cellColor["\(x)\(y)"] ?? "No such value")
*/
/*
 lesson 9:
    1. Text line, count amount of vovels and consonance
    2. Three elements, name and surname, age. Switch get age analise it and print what period of life this age is
    3. Student with name, surname and parant name. Analise first characters of all this words. If name start from a or o - print name
                                           b or d - name and parent name
                                           e or z - surname
 


let name = "Ather"
let surname = "Branderburg"
let parentName = "Erastovich"
let age = 18

switch age{
case 0...16: print("Hello young fellow")
case 17...23: print("Hello, student")
case 24...30: print("Hello, man")
default: break
    
}

for (index, n) in name.enumerated(){
    if(index == 0){
        print(n)
        switch n{
            case _ where n == "A" || n == "O": print("Hello \(name)")
            case let x where x == "b" || x == "d":print ("Hello \(name) \(parentName)")
            case let x where x == "e" || x == "z": print("Hello, \(surname)")
            default: print("Hello, \(surname) \(name) \(parentName)!")
        }
    }
}
let textLine = "Hello, my friendo!"
let textVovel: [Character] = ["a", "e","i", "o", "u", "y"]
let textConsonance: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k",
                "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]

for i in textLine{
    var countVovels = 0
    var countConssenonce = 0
    var flag = false
    if textVovel.contains(i){
        flag = true
    } else{
        flag = false
    }
    switch flag{
        case false: countConssenonce += 1
        case true: countVovels += 1
    }
}


var mass = [1, 5, 2, 3, 4, 10]
let sum = mass.reduce(0){sum, i in sum + i}
print(sum)
*/


/* lesson 10. Functions
  1. Create function, chess board, thet get two coordinates and print cell color.
*/
import UIKit
import Darwin
// 1
func chessColor(coordinate: (String, Int)) -> String{
    let x = coordinate.0
    let y = coordinate.1
    var cellColor = [String:String]()
    let cellX = ["a", "b", "c", "d", "e", "f", "g", "h"]
    let cellY = [1, 2, 3, 4, 5, 6, 7, 8]
    for yVal in cellY{
        for (index, charact) in cellX.enumerated(){
            if(yVal % 2 == index + 1 % 2){
                cellColor.updateValue("black", forKey: "\(yVal)\(charact)")
            }else{
                cellColor.updateValue("white", forKey: "\(yVal)\(charact)")
            }
        }
    }

    return cellColor["\(y)\(x)"] ?? "No such value"
}
let coordinate = (x: "a", y: 7)
let cellColor = chessColor(coordinate: coordinate)

// 2
func reversMas(mas: [Int]) -> [Int]{
    var reversMas = [Int]()
    for index in (0...mas.count - 1).reversed(){
        reversMas.append(mas[index])
    }
    return reversMas
}
var agesInSchool = [Int]()
for value in 0...17{
    agesInSchool.append(value)
}
let reversAges = reversMas(mas: agesInSchool)
let sum = agesInSchool.reduce(0,+)


func emptyFunc() -> () -> (){
    func zeroFunc(){
        print("zero")
    }
    return zeroFunc
}
let printer = emptyFunc()
printer()
