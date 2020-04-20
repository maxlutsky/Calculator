//
//  ViewController.swift
//  Calculator
//
//  Created by Max on 04/03/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var funcLine: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    @IBOutlet weak var switchDarkMode: UISwitch!
    @IBOutlet weak var labelDarkMode: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:
    func addSymbol(i: Int){
        guard var numbers = firstLine.text else { return }
        
        if numbers.count < 10{
            
            if numbers == "0" {
                numbers = String(i)
            } else {
                numbers += String(i)
            }
            firstLine.text = numbers
        }else{
            return
        }
        
    }
    
    func addFunction(i: String){
        funcLine.text = i
    }
    
    func newLine(){
        secondLine.text = firstLine.text
        firstLine.text = "0"
    }
    
    //MARK: MainFunction
    func result(){
        guard let funcSymbol = funcLine.text else { return }
        guard let firstLineS = firstLine.text else { return }
        guard let secondLineS = secondLine.text else { return }
        guard let firstLineNumb = Int(firstLineS) else { return }
        guard let secondLineNumb = Int(secondLineS) else { return }
        
        
        
        if funcSymbol == "+"{
            firstLine.text = String(firstLineNumb + secondLineNumb)
            funcLine.text = ""
        }
        if funcSymbol == "-"{
            firstLine.text = String(secondLineNumb - firstLineNumb)
            funcLine.text = ""
        }
        if funcSymbol == "*"{
            firstLine.text = String(firstLineNumb * secondLineNumb)
            funcLine.text = ""
        }
        if funcSymbol == "/"{
            if firstLineNumb != 0 {
                firstLine.text = String(secondLineNumb / firstLineNumb )
                funcLine.text = ""
            }else{
                let alert = UIAlertController(title: "Error", message: "Can not divide by zero.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    //MARK: ClearButtons
    @IBAction func buttonRemoveLast(_ sender: Any) {
        guard var numbers = firstLine.text else { return }
        if(numbers.count > 1){
            numbers.removeLast()
            firstLine.text = numbers
        }else{
            numbers = "0"
            firstLine.text = numbers
        }
        
    }
    
    @IBAction func buttonClear(_ sender: Any) {
        firstLine.text = "0"
        secondLine.text = "0"
        funcLine.text = ""
    }
    
    
    
    
    
    //MARK: NumberButtons
    @IBAction func button1(_ sender: Any) {
        addSymbol(i: 1)
    }
    
    @IBAction func button2(_ sender: Any) {
        addSymbol(i: 2)
    }
    
    @IBAction func button3(_ sender: Any) {
        addSymbol(i: 3)
    }
    
    @IBAction func button4(_ sender: Any) {
        addSymbol(i: 4)
    }
    
    @IBAction func button5(_ sender: Any) {
        addSymbol(i: 5)
    }
    
    @IBAction func button6(_ sender: Any) {
        addSymbol(i: 6)
    }
    
    @IBAction func button7(_ sender: Any) {
        addSymbol(i: 7)
    }
    
    @IBAction func button8(_ sender: Any) {
        addSymbol(i: 8)
    }
    
    @IBAction func button9(_ sender: Any) {
        addSymbol(i: 9)
    }
    
    @IBAction func button0(_ sender: Any) {
        addSymbol(i: 0)
    }
    
    
    
    //MARK: FunctionButtons
    @IBAction func buttonPlus(_ sender: Any) {
        result()
        newLine()
        addFunction(i: "+")
        
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        result()
        newLine()
        addFunction(i: "-")
    }
    
    
    @IBAction func buttonMultiply(_ sender: Any) {
        result()
        newLine()
        addFunction(i: "*")
    }
    
    @IBAction func buttonDivide(_ sender: Any) {
        result()
        newLine()
        addFunction(i: "/")
    }
    
    @IBAction func buttonResult(_ sender: Any) {
        result()
        newLine()
    }
    
    @IBAction func switchDarkMode(_ sender: Any) {
        if switchDarkMode.isOn{
            self.view.backgroundColor = UIColor.black
            labelDarkMode.textColor = UIColor.white
            firstLine.textColor = UIColor.white
            
        }else{
            self.view.backgroundColor = UIColor.white
            labelDarkMode.textColor = UIColor.black
            firstLine.textColor = UIColor.black
            
        }
    
    }
    
}


