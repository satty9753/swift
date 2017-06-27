//
//  ViewController.swift
//  GirlFrotierAsk
//
//  Created by Michelle Chen on 2017/6/16.
//  Copyright © 2017年 Michelle Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //建少女前線正面array
    var girlFrontierArray:[UIImage] = [
         UIImage(named: "9A91")!,
         UIImage(named: "AR15")!,
         UIImage(named: "HK416")!,
         UIImage(named: "Kar")!,
         UIImage(named: "M14")!,
         UIImage(named: "M950A")!,
         UIImage(named: "OTs-14")!,
         UIImage(named: "P7")!,
         UIImage(named: "sr-3mp")!,
         UIImage(named: "WA2000")!
    ]
    //建答案array
    var answerArray:[String] = ["9A91","AR15","HK416","Kar98k","M14","M950A",
         "OTs-14", "P7", "sr-3mp", "WA2000"]
    
    //見少女前線影子array
    var girlFrontierShadowArray:[UIImage] = [
        UIImage(named: "9A91Shadow")!,
        UIImage(named: "AR15Shadow")!,
        UIImage(named: "HK416Shadow")!,
        UIImage(named: "KarShadow")!,
        UIImage(named: "M14Shadow")!,
        UIImage(named: "M950AShadow")!,
        UIImage(named: "OTs-14Shadow")!,
        UIImage(named: "P7Shadow")!,
        UIImage(named: "sr-3mpShadow")!,
        UIImage(named: "WA2000Shadow")!
    ]
 
    @IBOutlet weak var answerTextField: UITextField!
    
    //拉兩個image View重疊，一個放正面圖片，一個放影子圖片
    @IBOutlet weak var gfImage: UIImageView!
    @IBOutlet weak var gfShadowView: UIImageView!
    var count = 0
    var shadowcount = 1
    @IBAction func nextButton(_ sender: Any) {   //下一題只控制影子的圖
        gfImage.isHidden = true
        gfShadowView.isHidden = false
        view.backgroundColor = UIColor.white
        gfShadowView.image = girlFrontierShadowArray[shadowcount]
        shadowcount += 1
        if shadowcount == 10{
            shadowcount = 0 //從第10張回到第1張
        }
    }
    
    @IBAction func enterButton(_ sender: Any) { //送出只控制正面的圖
        gfShadowView.isHidden = true
        gfImage.isHidden = false
        if answerTextField.text! == answerArray[count]{
            gfImage.image = girlFrontierArray[count]
            view.backgroundColor = UIColor.green //答對背景是綠色的
            count += 1
            if count == 10{
             count = 0  //從第10張回到第1張
            }
        }
        else{
            shadowcount = count   //答錯不會往下一題，回到同一題
            gfShadowView.isHidden = true
            gfImage.isHidden = true
           view.backgroundColor = UIColor.red //答錯背景是紅色的
        }
     
       }
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gfShadowView.image = UIImage(named:"9A91Shadow")//初始畫面9A91

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

