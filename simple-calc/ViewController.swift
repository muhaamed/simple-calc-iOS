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
    
    
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    var numberArray = [Double]()
    var numString:String = ""
    var mathOperator = ""
    var historyList = [String]()
    var value3 = ""

    
    
    @IBAction func numbers(_ sender: UIButton) {
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
            var historyString = ""
            switch mathOperator {
            case "Fact":
                if numberArray.count == 1{
                    
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
                    historyString = "\(numberArray[0]) "+mathOperator+" = "+"\(answer)"
                    numberArray = []
                    label.text = String(answer)
                    mathOperator = ""
                    numString = ""
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
                if numberArray.count == 1{
                    historyString = "\(numberArray.count) "+mathOperator+" = "+"\(answer)"
                }else{
                    for i in 1...numberArray.count{
                        if i == numberArray.count{
                            historyString = historyString+" \(numberArray[i-1])"+" = "+"\(answer)"
                        }else{
                            historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                        }
                    }
                }
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "Avg":
                var answer = 0.0
                let count:Double = Double(numberArray.count)
                for i in 1...numberArray.count{
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }
                    answer = answer+numberArray[i-1]
                }
                answer = answer/count
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
                
            case "%":
                var answer = 0.0
                for i in 1...numberArray.count{
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }

                    
                    if answer == 0.0{
                        answer = numberArray[i-1]
                    }else{
                        answer = answer.truncatingRemainder(dividingBy: numberArray[i-1])
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "÷":
                var answer = 0.0
                for i in 1...numberArray.count{
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }

                    
                    if answer == 0.0{
                        answer = numberArray[i-1]
                    }else{
                        answer = answer / numberArray[i-1]
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "x":
                var answer = 0.0
                for i in 1...numberArray.count{
                    
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }

                    
                    if answer == 0.0{
                        answer = numberArray[i-1]
                    }else{
                        answer = answer * numberArray[i-1]
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "-":
                var answer = 0.0
                 for i in 1...numberArray.count{
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }

                    if answer == 0.0{
                        answer = numberArray[i-1]
                    }else{
                        answer = answer - numberArray[i-1]
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "+":
                var answer = 0.0
                for i in 1...numberArray.count{
                    if i == numberArray.count{
                        historyString = historyString+" \(numberArray[i-1])"
                    }else{
                        historyString = historyString+" \(numberArray[i-1]) "+mathOperator
                    }
                    
                    if answer == 0.0{
                        answer = numberArray[i-1]
                    }else{
                        answer = answer + numberArray[i-1]
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                historyString = historyString+" = "+"\(answer)"
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            default:
                print("default")
            }
            
            historyList.append(historyString)
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : HistoryViewController = segue.destination as! HistoryViewController
        destViewController.history = historyList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

