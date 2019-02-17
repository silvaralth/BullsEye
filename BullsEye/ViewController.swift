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
    var diference: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        calcDiferecnce()
        let messageInAlert = "Your slider value is \(currentValue)" + "\nThe target was \(targetValue)" + ", the diference is \(diference)"
        let alert = UIAlertController(title: "Hello world", message: messageInAlert, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        // print("Slider val: \(slider.value) - rounded: \(roundedValue)")
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func calcDiferecnce() {
        if (targetValue > currentValue) {
            diference = targetValue - currentValue
        }
        if (targetValue < currentValue) {
            diference = currentValue - targetValue
        }
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

