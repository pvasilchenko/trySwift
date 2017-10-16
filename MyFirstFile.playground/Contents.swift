

import Foundation
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

