//
//  ViewController.swift
//  Huashen-Liang_COMP2125_Lab03
//
//  Created by Huashen Liang on 2019-07-10.
//  Copyright © 2019 Huashen Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var displayValue: Double {
        get {
            guard let number = Double(BillAmount.text!) else {
                fatalError("Cannot convert text to a double")
            }
            return number
        }
        
        set{
            BillAmount.text = String(newValue)
        }
    }
    
    @IBOutlet weak var tip15: UILabel!
    @IBOutlet weak var tipCustom: UILabel!
    
    @IBOutlet weak var total15: UILabel!
    @IBOutlet weak var totalCustom: UILabel!
    
    @IBOutlet weak var customTip: UILabel!
    @IBOutlet weak var BillAmount: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var PercentageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Slider(_ sender: UISlider) {
        
        //display for 15% tip
        caculateTipAndTotal(TipValue: 1)
        
        //for slider to place at excat position
        Slider.value = roundf(Slider.value)
        

        if Slider.value == 0 {
            PercentageLabel.text = "Custom Tip Percentage: 10%"
            caculateTipAndTotal(TipValue: 0)
            customTip.text = "10%"
            
        }else if Slider.value == 1 {
            PercentageLabel.text = "Custom Tip Percentage: 15%"
            caculateTipAndTotal(TipValue: 1)
           
        }else if Slider.value == 2 {
            PercentageLabel.text = "Custom Tip Percentage: 18%"
            caculateTipAndTotal(TipValue: 2)
            customTip.text = "18%"
            
        }else if Slider.value == 3 {
            PercentageLabel.text = "Custom Tip Percentage: 20%"
            caculateTipAndTotal(TipValue: 3)
            customTip.text = "20%"
            
        }else if Slider.value == 4 {
            PercentageLabel.text = "Custom Tip Percentage: 25%"
            caculateTipAndTotal(TipValue: 4)
            customTip.text = "25%"
            
        }else if Slider.value == 5 {
            PercentageLabel.text = "Custom Tip Percentage: 30%"
            caculateTipAndTotal(TipValue: 5)
            customTip.text = "30%"
        }
        
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let newValue = sender.currentTitle{
            //user pressed "." button
            if newValue == "." {
                if (BillAmount.text?.contains("."))! {
                        return
                    }
                }
            BillAmount.text = BillAmount.text! + newValue
        }
    }
    
    //clear all the labels
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        BillAmount.text = ""
        tip15.text = ""
        total15.text = ""
        tipCustom.text = ""
        totalCustom.text = ""
        customTip.text = ""
    }
    
    //caculate for Tip and total amount
    func caculateTipAndTotal(TipValue: Float){
        guard let billText = BillAmount.text else {
            return
        }
        guard let num = Float(billText) else {
            return
        }
        
        if TipValue == 0 {
            tipCustom.text = String(format:"%.2f", num * 0.01)
            totalCustom.text = String(format:"%.2f",num * 1.01)
        }else if TipValue == 1 {
            tip15.text = String(format:"%.2f",num * 0.15)
            total15.text = String(format:"%.2f",num * 1.15)
        }else if TipValue == 2 {
            tipCustom.text = String(format:"%.2f",num * 0.18)
            totalCustom.text = String(format:"%.2f",num * 1.18)
        }else if TipValue == 3 {
            tipCustom.text = String(format:"%.2f",num * 0.20)
            totalCustom.text = String(format:"%.2f",num * 1.20)
        }else if TipValue == 4 {
            tipCustom.text = String(format:"%.2f",num * 0.25)
            totalCustom.text = String(format:"%.2f",num * 1.25)
        }else if TipValue == 5 {
            tipCustom.text = String(format:"%.2f",num * 0.30)
            totalCustom.text = String(format:"%.2f",num * 1.30)
        }
    }
}
    

