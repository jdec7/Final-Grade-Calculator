//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by  on 10/17/22.
//

import UIKit

class ViewController: UIViewController {

    var curGrade:Double = 0
    var finalGrade:Double = 0
    var examWeight:Double = 0
    
    
    @IBOutlet weak var curGradeSlider: UISlider!
    
    @IBOutlet weak var finalGradeSlider: UISlider!
    
    @IBOutlet weak var examWeightSlider: UISlider!
    
    
    @IBOutlet weak var curGradeLabel: UILabel!
    
    @IBOutlet weak var finalGradeLabel: UILabel!
    
    @IBOutlet weak var examWeightLabel: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func getLetter(grade: Double) -> String {
        
        var letterGrade = ""
        
        switch grade {
        case 90...:
            letterGrade = "(A)"
        case 80...90:
            letterGrade = "(B)"
        case 70...80:
            letterGrade = "(C)"
        case 60...70:
            letterGrade = "(D)"
        default:
            letterGrade = "(F)"
        }
        
        return letterGrade
        
    }
    
    @IBAction func curGradeSliderMoved(_ sender: UISlider) {
        curGrade = Double(round(curGradeSlider.value * 100.0))
        curGradeLabel.text = "\(Int(curGrade))% \(getLetter(grade: curGrade))"
    }
    
    @IBAction func finalGradeSliderMoved(_ sender: UISlider) {
        finalGrade = Double(round(finalGradeSlider.value * 100.0))
        finalGradeLabel.text = "\(Int(finalGrade))% \(getLetter(grade: finalGrade))"
    }
    
    @IBAction func examWeightSliderMoved(_ sender: UISlider) {
        examWeight = Double(round(examWeightSlider.value * 100.0)) / 100
        examWeightLabel.text = "\(Int(examWeight * 100))%"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if examWeight > 0{
            let neededGrade = Double(round((finalGrade - (curGrade * (1 - examWeight))) / examWeight))
            resultLabel.text = "\(Int(neededGrade)) \(getLetter(grade: neededGrade))"
        }
        else {
            resultLabel.text = "Exam weight too low"
        }
    }
}

