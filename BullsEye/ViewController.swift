//
//  ViewController.swift
//  BullsEye
//
//  Created by ian on 12/7/18.
//  Copyright © 2018 ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello world", message: "This is a lorem ipsum", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func whoisthere() {
        let alert = UIAlertController(title: "YEEES?", message: "WHO IS THERE?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Me", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

