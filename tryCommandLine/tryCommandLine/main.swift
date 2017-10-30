// non alcohol drinks shop
import Foundation
class Shop{
    
             let drinkBase = ["Apple juice" : 24,
                              "Orange juice" : 23,
                              "Blood orange punch" : 40,
                              "Homemade cordial" : 45,
                              "Smoothies" : 35]
    var shop = Shop()
    lazy var custumer = shop.custumerInfo()
    func custumerInfo() -> Bool{
        print("Hello, User! Please, enter your Name:")
        let custumerName = readLine()
        print("Hello, \(String(describing: custumerName))!")
        return true
    }
    func offerDrinkBase(){
        print("What do you want tp buy? \n \(drinkBase)")
    }
}
