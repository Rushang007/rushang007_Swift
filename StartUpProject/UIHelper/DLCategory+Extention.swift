//
//  DLCategory+Extention.swift
//  PreGame
//
//  Created by Moweb_10 on 19/07/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public class func fromNib(_ nibNameOrNil:String) ->  UIView {
        return  Bundle.main.loadNibNamed(nibNameOrNil, owner: nil, options: nil)!.first as! UIView
    }
    
}

extension UIView{
    
    func ClearColorShaddow(_ alpha:Float){
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = (self.frame.size.height)/2
        self.layer.shadowPath = CGPath(rect: CGRect(x: 0,y: 0, width: self.frame.width,height: self.frame.height), transform: nil)
        self.layer.shadowOpacity = alpha
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        
    }
    
    @IBInspectable var DLCorneredius:CGFloat{
        
        get{
            return layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var DLBorderWidth:CGFloat{
        
        get{
            return layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var DLBorderColor:UIColor{
        
        get{
            return self.DLBorderColor
        }
        set{
            self.layer.borderColor = newValue.cgColor
            
        }
    }
    @IBInspectable var DLRoundDynamic:Bool{
        
        get{
            return false
        }
        set{
            if newValue == true {
                
                self.perform(#selector(UIView.AfterDelay), with: nil, afterDelay: 0.0)
            }
            
        }
        
    }
    func AfterDelay(){
        
        let  Height =  self.frame.size.height
        self.layer.cornerRadius = Height/2;
        self.layer.masksToBounds = true;
        
        
    }
    @IBInspectable var DLRound:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                self.layer.cornerRadius = self.frame.size.height/2;
                self.layer.masksToBounds = true;
            }
            
        }
    }
    @IBInspectable var DLShadow:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
                self.layer.shadowOpacity = 0.6;
                
            }
            
        }
        
    }
    @IBInspectable var DLclipsToBounds:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                
                self.clipsToBounds = true;
            }else{
                self.clipsToBounds = false
            }
            
        }
        
    }
    
    
    func roundMake() {
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.masksToBounds = true;
    }
    
}

extension UILabel{
    
    @IBInspectable var FontAutomatic:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let  height = (self.frame.size.height*SCREEN_HEIGHT)/568;
                self.font = UIFont(name:self.font.fontName, size:(height*self.font.pointSize)/self.frame.size.height )
            }
            
        }
        
    }
    
}
extension UITextView {
    
    @IBInspectable var FontAutomatic:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let  height = (self.frame.size.height*SCREEN_HEIGHT)/568;
                self.font = UIFont(name:self.font!.fontName, size:(height*self.font!.pointSize)/self.frame.size.height )
            }
            
        }
        
    }
    
    @IBInspectable var Pedding:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.height))
                self.addSubview(paddingView)
            }
            
        }
        
    }
    

    
}
extension UITextField{
    
    @IBInspectable var FontAutomatic:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let  height = (self.frame.size.height*SCREEN_HEIGHT)/568;
                self.font = UIFont(name:self.font!.fontName, size:(height*self.font!.pointSize)/self.frame.size.height )
            }
            
        }
        
    }
    
    func setBottomBorder(_ color:UIColor, width:CGFloat) {
        
        var view = self.viewWithTag(2525)
        if view == nil {
            
            view = UIView(frame:CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height))
            view?.backgroundColor = color
            view?.tag = 2525
            self .addSubview(view!)
        }
        
        
    }
    
    
    @IBInspectable var Pedding:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.height))
                self.leftView = paddingView
                self.leftViewMode = UITextFieldViewMode.always                }
            
        }
        
    }
    
    
    func leftButton(imageName:String) {
        
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.height, height:  self.frame.size.height)
        self.leftView = btn;
        self.leftViewMode = .always
       // return btn
        
    }
    
    func rightButton(imageName:String) {
        
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.frame = CGRect.init(x:  (SCREEN_WIDTH - self.frame.size.height), y: 0, width: self.frame.size.height, height:  self.frame.size.height)
        self.rightView = btn;
        self.rightViewMode = .always
       // return btn
        
    }
    func leftpedding(){
        
        let btn = UIButton.init(type: .custom)
        btn.setImage(nil, for: .normal)
        btn.frame = CGRect.init(x: 0, y: 0, width:10, height:  self.frame.size.height)
        self.leftView = btn;
        self.leftViewMode = .always
        
        
    }

    
    
}
extension UIButton{
    
    @IBInspectable var FontAutomatic:Bool{
        get{
            return true
        }
        set{
            
            if newValue == true {
                
                let  height = (self.frame.size.height*SCREEN_HEIGHT)/568;
                self.titleLabel!.font = UIFont(name:self.titleLabel!.font!.fontName, size:(height*self.titleLabel!.font!.pointSize)/self.frame.size.height )!
            }
            
        }
        
    }
    
}

extension UIScrollView{
    
    func AumaticScroller() {
        
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        
        self.contentSize = contentRect.size;
    }
    func AumaticScrollerFaxible() {
        
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        
        self.contentSize = CGSize(width: contentRect.width, height: contentRect.height + DLautomatic(60))
    }
    
    
}
extension UIImage{
    
    func DLresizeImage(_ newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
}

