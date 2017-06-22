//
//  DLDatePicker.swift
//  PreGame
//
//  Created by Moweb_10 on 03/08/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import Foundation
import UIKit
@objc protocol DLDatePickerDelegate {
    
    @objc optional func datePickerdidPickDate(date:NSDate);
    
    
}
class DLDatePickerView: UIView
{
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var  delegate : DLDatePickerDelegate?
    
    
    override func awakeFromNib() {
        
        self.datePicker.date = NSDate() as Date
        self.datePicker.minimumDate = NSDate() as Date
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        RemovePicker()
    }
    @IBAction func DonePress(sender: AnyObject) {
        
        self.delegate?.datePickerdidPickDate?(date: self.datePicker.date as NSDate)
        RemovePicker()
    }
    @IBAction func CancelPress(sender: AnyObject){
        
        RemovePicker()
    }
    
    func RemovePicker(){
        
        self.viewWithTag(5)?.alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0, options: .showHideTransitionViews, animations: {
            self.frame = CGRect(x:0, y:SCREEN_HEIGHT, width:SCREEN_WIDTH, height:SCREEN_HEIGHT)
            
            }, completion: {_ in
               
                self .removeFromSuperview()
        })

    }
}
