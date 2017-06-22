//
//  DLTextField.swift
//  PreGame
//
//  Created by Moweb_10 on 18/07/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import UIKit
@objc protocol DLTextFieldDelegate{
    @objc optional  func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    @objc optional func textFieldDidBeginEditing(textField: UITextField)
    @objc optional func textFieldShouldEndEditing(textField: UITextField) -> Bool
    @objc optional  func textFieldDidEndEditing(textField: UITextField)
    @objc optional  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString : String) -> Bool
    @objc optional  func textFieldShouldClear(textField: UITextField) -> Bool
    @objc optional  func textFieldShouldReturn(textField: UITextField) -> Bool
}
class DLTextField: UITextField ,UITextFieldDelegate{
    
    @IBOutlet var DLdelegate:AnyObject?
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
     init(frame: CGRect ,dd:String) {
        super.init(frame:frame)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        
        if let  scrollview = textField.superview!.superview  as? UIScrollView{
            scrollview.contentOffset = CGPoint(x:0, y:50+textField.frame.origin.y/2)
            
              let height =  SCREEN_HEIGHT-64 + scrollview.contentOffset.y
              if scrollview.contentSize.height < height{
                scrollview.contentSize = CGSize(width:0, height:height)
            }
        }
           

        
        
        let status = DLdelegate?.textFieldShouldBeginEditing?(textField)
        
        if status == nil {
            return true
        }
        return status!
        
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        
        DLdelegate?.textFieldDidBeginEditing?(textField)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        let status = DLdelegate?.textFieldShouldEndEditing?(textField)
        if status == nil {
            return true
        }
        return status!

        
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        
        DLdelegate?.textFieldDidEndEditing?(textField)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString : String) -> Bool {
        
        
        let status =  DLdelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: replacementString)
        
        if status == nil {
            return true
        }
        return status!
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        let status = DLdelegate?.textFieldShouldClear?(textField)
        if status == nil {
            return true
        }
        return status!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        let status = DLdelegate?.textFieldShouldReturn?(textField)
        
        if status == nil {
            textField.resignFirstResponder()
            return true
        }
        return status!
        
    }
}
