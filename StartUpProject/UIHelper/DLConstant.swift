//
//  Constant.swift
//  PreGame
//
//  Created by Moweb_10 on 18/07/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import Foundation
import UIKit



let appDelegate = UIApplication.shared.delegate as! AppDelegate



let SCREEN_WIDTH  = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let IS_IPHONE_4   = UIScreen.main.bounds.size.height == 480
let IS_IPHONE_5   = UIScreen.main.bounds.size.height == 568
let IS_IPHONE_6   = UIScreen.main.bounds.size.height == 667
let IS_IPHONE_6P  = UIScreen.main.bounds.size.height == 736


func kUserDefults(_ value : AnyObject, key : String ){
    let defults = UserDefaults.standard
    defults .setValue(value, forKey: key )
    defults.synchronize()
}
func kUserDefults_( _ key : String) -> AnyObject? {
    let defults = UserDefaults.standard
    return defults.value(forKey: key ) as AnyObject?
}
func DLautomatic( _ size : CGFloat) -> CGFloat {
    return size*SCREEN_WIDTH / 320
}

func DLautomatic_H( _ size : CGFloat) -> CGFloat {
    return size*SCREEN_HEIGHT / 568
}

//func InternetCheck () -> Bool {
//    
//    let reachability =  Reachability()
//    let networkStatus  = reachability?.currentReachabilityStatus
//    if networkStatus == .notReachable {
//        return false
//    }
//    return true
//}


func HideLoder(view:UIView?){
    
    
    if let viewloder =  view?.viewWithTag(323232) {
        let imgLoder = viewloder.viewWithTag(322525) as! UIActivityIndicatorView
        imgLoder.stopAnimating()
        viewloder.removeFromSuperview()
    }
    
   else if let viewloder =  appDelegate.window?.viewWithTag(323232) {
        let imgLoder = viewloder.viewWithTag(322525) as! UIActivityIndicatorView
        imgLoder.stopAnimating()
        viewloder.removeFromSuperview()
    }
    
}
func ShowLoader(view:UIView?,isEnable:Bool){
    
    if isEnable {
        if  view?.viewWithTag(323232) == nil {
            
            let viewloder = Bundle .main.loadNibNamed("LoderView", owner: nil, options: nil)![0] as! UIView
            viewloder.frame = UIScreen.main.bounds
            viewloder.backgroundColor = UIColor.clear
            viewloder.tag = 323232
            let imgLoder = viewloder.viewWithTag(322525) as! UIActivityIndicatorView
            imgLoder.startAnimating()
            imgLoder.center = CGPoint.init(x: viewloder.center.x, y: viewloder.center.y - 64)
            view!.bringSubview(toFront: viewloder)
            view!.addSubview(viewloder)
        }
 
    }
    else
    {
        if  view?.viewWithTag(323232) == nil {
            
            let viewloder = Bundle .main.loadNibNamed("LoderView", owner: nil, options: nil)![0] as! UIView
            viewloder.frame = UIScreen.main.bounds
            viewloder.backgroundColor = UIColor.clear
            viewloder.tag = 323232
            let imgLoder = viewloder.viewWithTag(322525) as! UIActivityIndicatorView
            imgLoder.startAnimating()
            imgLoder.center = CGPoint.init(x: viewloder.center.x, y: viewloder.center.y - 64)
            appDelegate.window!.bringSubview(toFront: viewloder)
            appDelegate.window!.addSubview(viewloder)
        }

    }
}

struct userType{
    
    
    static let  EndUser = 0
    static let  HostUser = 1
}


struct COLOR{
    static let PurpleColor = UIColor(red:144/255,green:19/255,blue:254/255,alpha: 1.0)
    static let borderColor = UIColor(red:215/255,green:215/255,blue:215/255,alpha: 1.0)
    static let theameColor = UIColor(red:44/255,green:168/255,blue:197/255,alpha: 1.0)
}


struct FONT{
    
    static let ProxiRegular = "ProximaNova-Regular"
    static  let ProxiBold = "ProximaNova-Bold"
    static let UltraRegular = "ProximaNova-RegularIt"
    static let UltraBold = "ProximaNova-SemiboldIt"
}


struct VALIDATION {

    static let dlkappname = "Roster Me"
    static let dlkInternet = "Please check your internet connection, and try again."
    static  let dlkServer = "Oops, server is not responding at the moment! Please try again later."
    static let dlkEmail = "Please enter valid email address."
    static let dlkMobile = "Please enter valid mobile number."
    static let dlkPassword = "Please enter valid password; it must be of 6 characters minimum."
    static let dlkFristname = "Please enter first name."
    static let dlkFullname = "Please enter full name."
    static let dlkEmptyPassword = "Please enter valid password."
    static let dlkEmptyName = "Please enter full name"
    static let dlkEmptyLicence = "Please enter Licence number."
    static let dlkEmptyMembership1 = "Please enter society membership number."
    static let dlkEmptyMembership2 = "Please enter insurance membership number/policy number."
    static let dlkprofilePic = "Please select your profile pic."
    static let dlkLastname  = "Please enter last name."
    static let dlkPassword_mismatch = "Confirm password did not match with your password!"
    static let dlklocationError = "Kindly turn on your device location service, in able to access your nearby data."
    static let dlkZipcode = "Please enter valid zip code."
    static let dlkfeedbackSend = "Thank You, your feedback has been submitted successfully."
    static let dlkFeedbackEmpty = "Please enter your feedback."
    static let dlkNewPassword = "Please enter valid new password, it must be of 6 characters minimum."
    static let dlkProfileSave = "Your profile has been saved successfully."
    static let dlkPasswordChange = "Your profile password has been changed now. "
    static let dlkContactUS = "Thank you for contacting us."
    static let dlkCreditcard = "Your card detail has been saved securely."
    static let dlkBookEvent = "Congratulations, your booking is confirmed. Enjoy!"
    static let dlklogout = "Are you sure want to log out ?"
    static let dlkEmptyCurrentPass = "Please enter current password."
    static let dlkSignOut = "Are you sure want to sign out app?"
    static let dlkJobAdded = "Job added successfully"
    
}
struct KEYSPROJECT {
    
    static let is_Login = "is_Login"
    static let isEmployer = "employer"
    static let isJobSeeker = "jobseeker"
    static let resultUser = "resultUser"
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let kClientID = "1057930044211-r7oqfr4q3mch7cs2nf3k1j60kdh82v1o.apps.googleusercontent.com"
    static let scopes = "https://www.googleapis.com/auth/drive.file"
    static let keychainItemName = "My App";
    static let HostStaus = "HostStaus";
    static let BaseUrl = "http://mowebify.com/rosterme/API/";
    static let WebUrl = "https://www.ipregaim.com/";
    static let StripeKey = "sk_test_y4IzEfbCTF5O6n8YnTTbhoSl";
    
}





