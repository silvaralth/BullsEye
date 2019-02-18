//
//  ViewController.swift
//  BullsEye
//
//  Created by ian on 12/7/18.
//  Copyright © 2018 ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var difference: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        newGame()
    }

    @IBAction func showAlert() {
        let titleAlert: String
        var plusPoints: String = ""
        let differenceValue = abs(currentValue - targetValue)
        var points = 100 - differenceValue
        if differenceValue == 0 {
            titleAlert = "Perfect!"
            points += 100
            plusPoints = "Wow, you got a 100 points bonus! "
        } else if differenceValue < 5 {
            titleAlert = "You almost had it!"
            if differenceValue == 1 {
                points += 50
                plusPoints = "Really close!, you got a 50 points bonus! "
            }
        } else if differenceValue < 10 {
            titleAlert = "Pretty good..."
        } else {
            titleAlert = "Not even close..."
        }
        score += points
        
        let messageInAlert = "\(plusPoints)You scored \(points) points"
        let alert = UIAlertController(title: titleAlert, message: messageInAlert, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        // print("Slider val: \(slider.value) - rounded: \(roundedValue)")
    }
    
    @IBAction func resetAlert() {
        let messageInAlert = "Are you sure?"
        let alert = UIAlertController(title: "Start Over", message: messageInAlert, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "No", style: .cancel , handler: nil)
        let action = UIAlertAction(title: "Yes", style: .default , handler: {
            action in
            self.newGame()
        })
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func newGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func calcDiferecnce() {
        if targetValue > currentValue {
            difference = targetValue - currentValue
        } else if targetValue < currentValue {
            difference = currentValue - targetValue
        } else {
            difference = 0
        }
    }
    
    func calcDifference () {
        difference = currentValue - targetValue
        if difference < 0 {
            // difference = difference * -1
            // difference = -difference
            difference *= -1
        }
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

