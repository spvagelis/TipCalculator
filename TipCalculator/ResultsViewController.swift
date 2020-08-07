//
//  ResultsViewController.swift
//  TipCalculator
//
//  Created by vagelis spirou on 5/8/20.
//  Copyright © 2020 vagelis spirou. All rights reserved.
//

import UIKit

protocol ResultsViewControllerDelegate {
    func resetAllDataOnTheFirstVC()
}

class ResultsViewController: UIViewController {
    
    var tip: Double?
    var numberOfUsers: Int?
    var billForEachOne: Double?
    var delegate: ResultsViewControllerDelegate?
    
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        totalBillLabel.text = String(format: "%.2f", billForEachOne!)
        let tipPercent = Int(tip! * 100)
        print(tipPercent)
        settingsLabel.text = "Split between \(String(describing: numberOfUsers!)) people, with \(tipPercent)% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        delegate?.resetAllDataOnTheFirstVC()
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
