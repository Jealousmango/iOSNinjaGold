//
//  ViewController.swift
//  NinjaGold
//
//  Created by Matthew Mitchell on 7/10/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    var score = 0
    
    @IBAction func resetButtonPressed(sender: UIButton) {
// reset score
        score = 0
        updateUI()
    }
    @IBAction func buildingButtonPressed(sender: UIButton) {
// User clicks Farm
        if sender.tag == 0 {
// generate ransom number
            let rand: UInt32 = arc4random_uniform(20) + 10
            var randNum: Int
            randNum = Int(rand)
            
// add random number into score
            score = score + randNum
// hide all labels except the one clicked
            farmLabel.text = "You earned \(randNum) gold!"
            
            farmLabel.hidden = false
            
            caveLabel.hidden = true
            houseLabel.hidden = true
            casinoLabel.hidden = true
        }
// User clicks Cave
        else if sender.tag == 1 {
            let rand: UInt32 = arc4random_uniform(10) + 5
            var randNum: Int
            randNum = Int(rand)
            
            score = score + randNum
            
            caveLabel.text = "You earned \(randNum) gold!"
            
            caveLabel.hidden = false

            
            farmLabel.hidden = true
            houseLabel.hidden = true
            casinoLabel.hidden = true
        }
// User clicks House
        else if sender.tag == 2 {
            let rand: UInt32 = arc4random_uniform(5) + 2
            var randNum: Int
            randNum = Int(rand)
            
            score = score + randNum
            
            houseLabel.text = "You earned \(randNum) gold!"
            
            houseLabel.hidden = false

            
            caveLabel.hidden = true
            farmLabel.hidden = true
            casinoLabel.hidden = true
        }
// User clicks Casino
        else if sender.tag == 3 {
            let rand: UInt32 = arc4random_uniform(50)
            var randNum: Int
            randNum = Int(rand)
// generate a random 0 or 1 to determine whether to subtract or add score
            let rand2: UInt32 = arc4random_uniform(2)
            var randNum2: Int
            randNum2 = Int(rand2)
            
            if randNum2 == 0 {
               score = score + randNum
                casinoLabel.text = "You earned \(randNum) gold!"
                
                casinoLabel.hidden = false

                
                caveLabel.hidden = true
                houseLabel.hidden = true
                farmLabel.hidden = true
            }
                
            else {
            score = score - randNum
                casinoLabel.text = "You lost \(randNum) gold!"
                
                casinoLabel.hidden = false
                
                caveLabel.hidden = true
                houseLabel.hidden = true
                farmLabel.hidden = true
            }
        }
        updateUI()
        print(score)
    }
    
    func updateUI() {
// updates the score placed at the top of the screen when invoked
        scoreLabel.text = "Score: \(score)"
    }
}
