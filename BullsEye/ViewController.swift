//
//  ViewController.swift
//  BullsEye
//
//  Created by ian on 12/7/18.
//  Copyright © 2018 ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        let messageInAlert = "The Slider value is \(currentValue)"
        let alert = UIAlertController(title: "Hello world", message: messageInAlert, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        print("The Slider value is \(slider.value) and the rounded is \(roundedValue)")
        // currentValue = Int(slider.value)
        currentValue = Int(roundedValue)
    }
    
}

