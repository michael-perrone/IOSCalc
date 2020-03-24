//
//  ViewController.swift
//  CalcIOS
//
//  Created by Michael Perrone on 3/23/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum: String = "";
    
    var operation: String = "";
    
    var secondNum: String = "";
    
    var haveResult = false;
    
    var numAfterResult = "";
    
    var resultNumber = "";
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func clear() {
        resultNumber = "";
        firstNum = "";
        operation = "";
        secondNum = "";
        numAfterResult = "";
        haveResult = false;
        resultNumber = "";
        result.text = "0";
    }
    
    @IBAction func equals(_ sender: UIButton) {
        resultNumber = String(doOperation());
        print(resultNumber)
        let newArray = resultNumber.components(separatedBy: ".");
        if newArray[1] == "0" {
            result.text = newArray[0]
            numAfterResult = "";
        }
        else {
            print(resultNumber)
            result.text = resultNumber;
            numAfterResult = "";
        }
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
        setOperation(operation: "*")
    }
    
    @IBAction func add(_ sender: Any) {
        setOperation(operation: "+")
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        setOperation(operation: "-")
    }
    
    @IBAction func divide(_ sender:UIButton) {
        setOperation(operation: "/")
    }
    
    @IBAction func buttonClicked(_ sender:UIButton) {
        if operation == "" {
            firstNum += String(sender.tag);
            result.text = firstNum;
        }
        else if operation != "" && !haveResult {
            secondNum += String(sender.tag)
            result.text = secondNum;
        }
        else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            result.text = numAfterResult;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setOperation(operation: String) {
        self.operation = operation
    }
    
    func doOperation() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true;
                return Double(firstNum)! + Double(secondNum)!;
        }
            else {
                return Double(resultNumber)! + Double(numAfterResult)!;
            }
        } else if operation == "-" {
            if !haveResult {
                haveResult = true;
                return Double(firstNum)! - Double(secondNum)!;
            }
            else {
                return Double(resultNumber)! - Double(numAfterResult)!
            }
        }
        else if operation == "*" {
            if !haveResult {
                haveResult = true;
                return Double(firstNum)! * Double(secondNum)!;
            }
            else {
                return Double(resultNumber)! * Double(numAfterResult)!
            }
        }
        else if operation == "/" {
            if !haveResult {
                haveResult = true;
                return Double(firstNum)! / Double(secondNum)!;
            }
            else {
                return Double(resultNumber)! / Double(numAfterResult)!
            }
        }
        else {
            return 0
        }
    }
}

