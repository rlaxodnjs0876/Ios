//
//  ViewController.swift
//  Calculator
//
//  Created by 김태원 on 2022/06/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isPlus = false
    var isMinus = false
    var isMulti = false
    var isDiv = false
    
    var sum = Int()
    var num = Int()
    var istypingBool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        if (display.text == "0"){
            display.text = ""
        }
        let digit = sender.currentTitle!
        
        if istypingBool{
            let textDisplay = display.text!
            display.text = textDisplay + digit
        }else {
            display.text = digit
        }
        istypingBool = true
    }
    @IBAction func clear(_ sender: Any) {
        display.text = "0"
        sum = 0
        num = 0
    }
    
    @IBAction func plus(_ sender: Any) {
        if (isPlus == false) {
            num = Int(display.text!)!
            print("num",num)
            sum = num + sum
            istypingBool = false
            isPlus = true
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        if (isMinus == false) {
            num = Int(display.text!)!
            print("num",num)
            sum = num + sum
            istypingBool = false
            isMinus = true
        }
    }
    
    @IBAction func multi(_ sender: Any) {
        if (isMulti == false) {
            num = Int(display.text!)!
            print("num",num)
            sum = num + sum
            istypingBool = false
            isMulti = true
        }
    }
    @IBAction func divide(_ sender: Any) {
        if (isDiv == false) {
            num = Int(display.text!)!
            print("num",num)
            sum = num + sum
            istypingBool = false
            isDiv = true
        }
    }
    
    @IBAction func  result(_ sender: Any) {
        if isPlus {
            sum = sum + Int(display.text!)!
            print("result = ", sum)
            isPlus = false
            display.text = String(sum)
        }
        
        if isMinus{
            sum = sum - Int(display.text!)!
            print("result = ",sum)
            isMinus = false
            display.text = String(num)
        }
        if isMulti{
            sum = sum * Int(display.text!)!
            print("result = ",sum)
            isMulti = false
            display.text = String(num)
        }
        if isDiv{
            sum = sum / Int(display.text!)!
            print("result = ",sum)
            isDiv = false
            display.text = String(num)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

