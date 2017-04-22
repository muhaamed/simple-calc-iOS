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
                    let historyString = "\(numberArray[0]) "+mathOperator+" = "+"\(answer)"
                    print(historyString)
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
                var historyString = ""
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "Avg":
                var answer = 0.0
                var historyString = ""
                let count:Double = Double(numberArray.count)
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }

                    answer = answer+i
                }
                answer = answer/count
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
                
            case "%":
                var answer = 0.0
                var historyString = ""
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }

                    
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer.truncatingRemainder(dividingBy: i)
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "÷":
                var answer = 0.0
                var historyString = ""
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }

                    
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer / i
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "x":
                var answer = 0.0
                var historyString = ""
                for i in numberArray{
                    
                    if i != numberArray.last{
                        
                        historyString = historyString+" \(i)"
                    }else{
                        
                        historyString = historyString+" \(i) "+mathOperator
                        print(mathOperator)
                    }

                    
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer * i
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "-":
                var answer = 0.0
                var historyString = ""
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }

                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer - i
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString)
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
            case "+":
                var answer = 0.0
                var historyString = ""
                for i in numberArray{
                    if i == numberArray.last{
                        historyString = historyString+" \(i)"
                    }else{
                        historyString = historyString+" \(i) "+mathOperator
                    }
                    
                    if answer == 0.0{
                        answer = i
                    }else{
                        answer = answer + i
                    }
                }
                if answer.truncatingRemainder(dividingBy: 1) != 0{
                    answer = answer.roundTo(places: 8)
                }
                print(historyString+" = "+"\(answer)")
                value3 = historyString
                numberArray = []
                label.text = String(answer)
                mathOperator = ""
                numString = ""
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destViewController : HistoryViewController = segue.destination as! HistoryViewController
//        destViewController.labelText = value3+"\nhello"
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        label.textColor = UIColor.white
//        label.center = CGPoint(x: 0, y: 285)
//        label.textAlignment = .left
//        label.text = "I'am a test label"
//        destViewController.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

