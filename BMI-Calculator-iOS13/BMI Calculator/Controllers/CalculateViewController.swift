//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kumar Pujala on 24/01/2022.
//  Copyright © 2022 Kumar Pujala. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 15
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let currentHeightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(currentHeightValue)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let currentWeightValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(currentWeightValue)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

