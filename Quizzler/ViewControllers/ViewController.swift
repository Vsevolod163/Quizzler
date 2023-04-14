//
//  ViewController.swift
//  Quizzler
//
//  Created by Vsevolod Lashin on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        
        trueButton.layer.borderWidth = 1.0
        falseButton.layer.borderWidth = 1.0
        
        trueButton.layer.borderColor = UIColor.white.cgColor
        falseButton.layer.borderColor = UIColor.white.cgColor
    }


}

