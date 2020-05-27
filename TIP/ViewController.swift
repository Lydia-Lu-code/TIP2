//
//  ViewController.swift
//  TIP
//
//  Created by 維衣 on 2020/5/21.
//  Copyright © 2020 Lydia-L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totelLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var totelButton: UIButton!
        
    var cash = 0.0
    var tip = 0.0
    var tipsum = ""
    var cashsun = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }

    @IBAction func cashTextField(_ sender: UITextField) {
    }
    
    
    @IBAction func totelButton(_ sender: UIButton) {
        view.endEditing(true)
        calculation ()
       }
       
    @IBAction func resetButton(_ sender: UIButton) {
        view.endEditing(true)
        cashTextField.text! = ""
        totelLabel.text = "總計： \(0) 元"
        tipLabel.text = "小費： \(0) 元"
        noteLabel.text = String("σ` v´)σ 請輸入金額")
       }

    
    func calculation () {
        if let cash = Double(cashTextField.text!){
        
        if cash > 0 , cash <= 1000 {
        tip = 1.1
        noteLabel.text = "今天的消費，小費10%"


        }else if cash > 1000 , cash <= 5000 {
        tip = 1.15
        noteLabel.text = "今天的消費，小費15%"


        }else if cash > 5000{
        tip = 1.2
        noteLabel.text = "今天的消費，小費20%"


        }else if cash == 0 {
        tip = 1
        noteLabel.text = String("σ` v´)σ 請輸入金額")
            }
            
        //因為偶爾計算會跑出很多小數點，經Peter提醒 在這兩行加上"%.2f"，固定顯示小數位數2個位數。
        tipsum = String(format: "%.2f", (cash * tip) - cash)
        cashsun = String(format: "%.2f", cash * tip)
        tipLabel.text = "小費：   \(tipsum) 元"
        totelLabel.text = "總計： \(cashsun) 元"
        }
    }

}
