//
//  ViewController.swift
//  Math Genius
//
//  Created by 吳世馨 on 2021/1/3.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var calculationResult: UILabel!
    
    
    //編輯完收鍵盤的function
        func addTapGesture() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(tap)
        }
        
        @objc private func hideKeyboard(){
            self.view.endEditing(true)
        }
     
        override func viewDidLoad() {
            super.viewDidLoad()
            //viewDidLoad中呼叫此function，之後點空白處就可以收鍵盤。
            addTapGesture()
            
            if firstNum.text == "" {
                calculationResult.text = "0.00"
            } else if secondNum.text == "" {
                calculationResult.text = "0.00"}
        }

    @IBAction func equation(_ sender: UISegmentedControl) {
        let number1: Double? = Double(firstNum.text!)
        let number2: Double? = Double(secondNum.text!)
        var result: Double = 0
        
        if sender.selectedSegmentIndex == 0 {
            result = number1! + number2!
        } else if sender.selectedSegmentIndex == 1 {
            result = number1! - number2!
        } else if sender.selectedSegmentIndex == 2 {
            result = number1! * number2!
        } else if sender.selectedSegmentIndex == 3 { result = number1! / number2!}
        
        calculationResult.text = String(format: "%.2f", result)
    }
}
