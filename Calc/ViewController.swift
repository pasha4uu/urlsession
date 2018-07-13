//
//  ViewController.swift
//  Calc
//
//  Created by PASHA on 07/07/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var numberLbl: UILabel!
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performing:Bool = false
    var operation = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func numbersTap(_ sender: UIButton) {
        
        if performing == true
        {
            numberLbl.text = String(sender.tag-1)
            numberOnScreen = Double(numberLbl.text!)!
            performing = false
        }
        else
        {
        numberLbl.text = numberLbl.text! + String(sender.tag-1)
        
        numberOnScreen = Double(numberLbl.text!)!
        }
    }
    
    
    @IBAction func functionsTap(_ sender: UIButton) {
        
        if numberLbl.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(numberLbl.text!)!
            if sender.tag == 12
            {
                numberLbl.text = "/"
            }
            else if sender.tag == 13
            {
                numberLbl.text = "*"
            }
            else if sender.tag == 14
            {
                numberLbl.text = "-"
            }
            else if sender.tag == 15
            {
                numberLbl.text = "+"
            }
            
            operation = sender.tag
            performing = true
            
        }
        
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                  numberLbl.text = String(numberOnScreen / previousNumber)
            }
          else  if operation == 13
            {
                  numberLbl.text = String(previousNumber * numberOnScreen)
            }
           else if operation == 14
            {
                  numberLbl.text = String(previousNumber - numberOnScreen)
            }
           else if operation == 15
            {
                  numberLbl.text = String(previousNumber + numberOnScreen)
            }
            
           
        }
        else if sender.tag == 11
        {
            numberLbl.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            
        }
     
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

