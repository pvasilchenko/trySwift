//
//  ViewController.swift
//  BullsEye
//
//  Created by pVasilchenko on 05.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var currentValue = 0
    var targetValue = 0
    var roundValue = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        
        // slider UI
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        //let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
   @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        if (difference == 0){
            title = "Bull's Eye"
            points += 100
        }else if (difference) < 5{
            title = "You almost did it!"
            if(difference == 1){
                points += 50
            }
        }else if (difference <= 10){
            title = "Pretty good!"
        }else{
            title = "You can better..."
        }
        score += points
        let message = "The value of the slider is:\(currentValue)" +
                        "\n The difference is: \(difference)" +
                        "\n You scored: \(points) points"
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default,
                                            handler: {action in self.startNewRound()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame(){
        roundValue = 0
        score = 0
        startNewRound()
        //add core animation
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundValue += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundValue)
        scoreLabel.text = String(score)
    }
}

