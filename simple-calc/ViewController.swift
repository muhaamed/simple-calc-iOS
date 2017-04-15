//
//  ViewController.swift
//  simple-calc
//
//  Created by Muhaamed Drammeh on 4/14/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    var numberArray = [Double]()
    var numString:String = ""
    var mathOperator = ""
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        //print(sender.currentTitle)
        numString = numString + sender.currentTitle!
        label.text = numString
        
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        let value:Double = Double(label.text!)!
        if sender.currentTitle != "Fact"{
            numberArray.append(value)
        }
        
        if sender.currentTitle != "="{
            mathOperator = sender.currentTitle!
            numString = ""
        }else{
            //print(mathOperator)
            switch mathOperator {
            case "Fact":
                if numberArray.count == 1{
                    print("count == 1")
                    var answer = 1
                    var factNumber = 0
                    factNumber = Int(numberArray[0])
                    if factNumber == 0 {
                        answer = 1
                    }else{
                        while factNumber > 0{
                            answer *= factNumber
                            factNumber -= 1
                        }
                    }
                    numberArray = []
                    label.text = String(answer)
                    mathOperator = ""
                }
                else{
                    print("count > 1")
                    for i in numberArray{
                        print(i)
                    }
                    numberArray = []
                    label.text = "0"
                    mathOperator = ""
                }
            case "Count":
                var answer = 0
                let count = (numberArray.count)
                answer = count
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
            case "Avg":
                var answer = 0.0
                let count:Double = Double(numberArray.count)
                for i in numberArray{
                    answer = answer+i
                }
                answer = answer/count
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                
            case "%":
                var answer = 0.0
                for i in numberArray{
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer.truncatingRemainder(dividingBy: i)
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
            case "÷":
                var answer = 0.0
                for i in numberArray{
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer / i
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
            case "x":
                var answer = 0.0
                for i in numberArray{
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer * i
                    }
                }
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
            case "-":
                var answer = 0.0
                answer = numberArray[0]-numberArray[1]
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
            case "+":
                    var answer = 0.0
                    for i in numberArray{
                        answer = answer+i
                    }
                    numberArray = []
                    label.text = String(answer)
                    mathOperator = ""
            default:
                print("default")
            }
            
        }//end of else
        
    }//end of operations
    
    
    @IBAction func clear(_ sender: UIButton) {
        numString = ""
        numberArray = []
        label.text = "0"
        mathOperator = ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

