//
//  ViewController.swift
//  TipCalculator
//
//  Created by vagelis spirou on 4/8/20.
//  Copyright © 2020 vagelis spirou. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, ResultsViewControllerDelegate {
    
    var tipValue = 0.0
    var userToSplit = 0
    var billForEachPerson = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitNumberLabel.text = "0"
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        tipValue = Double(buttonTitleWithoutPercentSign)! / 100.0
        billTextField.endEditing(true)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        guard let bill = billTextField.text, bill != "" else {
            print("You forget to write the bill on textfield!")
            return
        }
        
        billForEachPerson = Double(bill)! * (1 + tipValue) / Double(userToSplit)
        print(String(format: "%.2f", billForEachPerson))
        
        performSegue(withIdentifier: "toResultsViewController", sender: self)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        userToSplit = Int(sender.value)
        splitNumberLabel.text = String(describing: "\(userToSplit)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toResultsViewController" else {
            return
        }
        
        let destinationVC = segue.destination as! ResultsViewController
        
        destinationVC.billForEachOne = billForEachPerson
        destinationVC.numberOfUsers = userToSplit
        destinationVC.tip = tipValue
        destinationVC.delegate = self
        
    }
    
    func resetAllDataOnTheFirstVC() {
        print("resetAllDataTheFirstVC")
        splitNumberLabel.text = "0"
        billTextField.text = ""
        zeroPercentButton.isSelected = true
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
}

