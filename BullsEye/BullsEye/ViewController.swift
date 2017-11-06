//
//  ViewController.swift
//  BullsEye
//
//  Created by pVasilchenko on 05.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   @IBAction func showAlert(){
        let message = "The value of the slider is:\(currentValue)" +
                        "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        targetLabel.text = String(targetValue)
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

