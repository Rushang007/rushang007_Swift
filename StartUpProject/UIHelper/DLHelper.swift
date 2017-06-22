//
//  DLHelper.swift
//  PreGame
//
//  Created by Moweb_10 on 19/07/16.
//  Copyright © 2016 Moweb_10. All rights reserved.


//Privacy - Photo Library Usage Description
//Privacy - Location When In Use Usage Description
//Privacy - Location Always Usage Description
//Privacy - Camera Usage Description

import Foundation
import UIKit
import AudioToolbox
import CoreLocation

private var _shareinstance : DLHelper? = nil


class DLHelper: NSObject {
    
    
    class func shareinstance()-> DLHelper {
        if _shareinstance == nil {
            _shareinstance = DLHelper()
        }
        return _shareinstance!
    }

    
    class func AlldefaultsRemove() {
        
        let defs = UserDefaults.standard
        let dict = defs.dictionaryRepresentation() as NSDictionary
        for key in dict.allKeys
        {
            if key as! String != "deviceToken_str"  {
                defs.removeObject(forKey: key as! String)
            }
        }
        defs.synchronize()

    }
    
    
    func DLService (view:UIView, indicater:Bool,isEnableLoader:Bool,  Apiurl:String, body:NSMutableDictionary?,Hendler complition:@escaping (_ JSON:NSDictionary,_ status:Int) -> Void) {
        
        
//        if InternetCheck() == false {
//            let Dict = NSDictionary()
//            complition(Dict,1234)
//            
//            if Apiurl != "JobList" {
//                DLHelper.ShowAlertError(message: VALIDATION.dlkInternet)
//            }
//            return
//        }
//                        
//        let url = NSURL(string:"\(KEYSPROJECT.BaseUrl)"  + Apiurl)
//        if url == nil {
//            DLHelper.ShowAlertError(message: "url not valid")
//            return
//        }
//        
//        
//        let request = NSMutableURLRequest(url: url! as URL)
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)        //session.delegate = self
//        request.httpMethod = "POST"
//        
//        var apibody:NSMutableDictionary!
//        if body == nil {
//            apibody = NSMutableDictionary()
//        }else{
//            apibody = body!.mutableCopy() as! NSMutableDictionary
//        }
//        
//        apibody["apiKey"] = "w2e2rosrt3y5u6iter8iug4h58mf1e3"
//        apibody["deviceType"] = "Iphone"
//        apibody["deviceToken"] = "Not allow permission"
//        apibody["intUdId"] =  UIDevice.current.identifierForVendor?.uuidString
//        
//        if let deviceToken_str = kUserDefults_("deviceToken_str") as? String{
//            apibody["deviceToken"] = deviceToken_str
//        }
//        if let userID = kUserDefults_(KEYSPROJECT.resultUser)?["ID"] as? String{
//            apibody["ID"] = userID
//        }
//        
//        
//        let  apiParameter = NSMutableString()
//        for key in apibody.allKeys {
//            if apiParameter.length != 0{
//                apiParameter.append("&")
//            }
//            if apibody[key as! String]! is NSString {
//                
//                let str = apibody.value(forKey: key as! String)! as! String
//                apibody[key as! String] = str.replacingOccurrences(of: "&", with: "%26")
//            }
//            
//            apiParameter.append("\(key)=\(apibody[key as! String]!)")
//            
//        }
//        
//        
//        
//        request.httpBody = apiParameter.data(using: String.Encoding.utf8.rawValue)
//        //  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        // request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        if indicater == true  {
//            
//            ShowLoader(view: view, isEnable: isEnableLoader)
//        }
//        
//        
//        
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
//            
//            DispatchQueue.main.async {
//                
//                if indicater == true  {
//                    
//                    HideLoder(view: view)
//                }
//                
//                if data != nil {
//                    
//                    let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                    print("Url: \(KEYSPROJECT.BaseUrl)" + Apiurl)
//                    print("Body: \(apibody!)" )
//                    print("Responcse : \(strData!)")
//                    
//                    do {
//                        if  let JSON = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
//                            if let errorCode = JSON["errorcode"] as? String {
//                                if errorCode == "1"{
//                                    complition(JSON,1)
//                                    return
//                                }else{
//                                    HideLoder(view: view)
//                                    DLHelper.ShowAlertError(message: JSON["msg"] as! String)
//                                }
//                            }
//                        }
//                    } catch {
//                        HideLoder(view: view)
//                        DLHelper.ShowAlertError(message: VALIDATION.dlkServer)
//                    }
//                }else{
//                    HideLoder(view: view)
//                    DLHelper.ShowAlertError(message: VALIDATION.dlkServer)
//                    
//                }
//                
//                
//            }
//            
//        })
//        task.resume()
    }
//    func DLService_Image (view:UIView, indicater:Bool,isEnableLoader:Bool,  Apiurl:String, body:NSMutableDictionary?,Hendler complition:@escaping (_ JSON:NSDictionary,_ status:Int) -> Void) {
//        
//        if InternetCheck() == false {
//            let Dict = NSDictionary()
//            complition(Dict,1234)
//            
//            if Apiurl != "JobList" {
//                DLHelper.ShowAlertError(message: VALIDATION.dlkInternet)
//            }
//            return
//        }
//
//        
//        let url = NSURL(string:"\(KEYSPROJECT.BaseUrl)" + Apiurl)
//        if url == nil {
//            DLHelper.ShowAlertError(message: "url not valid")
//            return
//        }
//        
//        
//        let request = NSMutableURLRequest(url: url as! URL)
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)        //session.delegate = self
//        request.httpMethod = "POST"
//        
//        var apibody:NSMutableDictionary!
//        if body == nil {
//            apibody = NSMutableDictionary()
//        }else{
//            apibody = body!.mutableCopy() as! NSMutableDictionary
//        }
//        
//        
//        
//        apibody["apiKey"] = "w2e2rosrt3y5u6iter8iug4h58mf1e3"
//        apibody["deviceType"] = "Iphone"
//        apibody["deviceToken"] = "Not allow permission"
//        apibody["intUdId"] =  UIDevice.current.identifierForVendor?.uuidString
//        
//        if let deviceToken_str = kUserDefults_("deviceToken_str") as? String{
//            apibody["deviceToken"] = deviceToken_str
//        }
//        if let userID = kUserDefults_(KEYSPROJECT.resultUser)?["ID"] as? String{
//            apibody["ID"] = userID
//        }
//        
//        //  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        // request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        
//        let boundary = "---------------------------14737809831466499882746641449"
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        
//        let body = NSMutableData()
//        
//        for key in apibody.allKeys{
//            
//            if apibody[key as! String]!  is NSString{
//                
//                
//                
//                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
//                body.append("Content-Disposition:form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
//                body.append("\(apibody[key as! String]!)\r\n".data(using: String.Encoding.utf8)!)
//                
//            }
//            else if apibody[key as! String]! is UIImage{
//                
//                let imageData = UIImageJPEGRepresentation(apibody[key as! String] as! UIImage, 0.5)
//                if imageData == nil {
//                    return
//                }
//                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
//                body.append("Content-Disposition:form-data; name=\"\(key)\"; filename=\"a.jpg\"\r\n".data(using: String.Encoding.utf8)!)
//                body.append("Content-Type: \("image/jpeg")\r\n\r\n".data(using: String.Encoding.utf8)!)
//                body.append(imageData!)
//                body.append("\r\n".data(using: String.Encoding.utf8)!)
//                
//                
//                
//            }
//            
//        }
//        
//        
//        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
//        request.httpBody = body as Data
//        if indicater == true  {
//            ShowLoader(view: view,isEnable: isEnableLoader)
//        }
//        
//        
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
//            
//            DispatchQueue.main.async {
//                
//                if indicater == true  {
//                    
//                    HideLoder(view: view)
//                }
//                
//                if data != nil {
//                    
//                    let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                    print("Url: \(KEYSPROJECT.BaseUrl)" + Apiurl)
//                    print("Body: \(apibody!)" )
//                    print("Response : \(strData!)")
//                    
//                    do {
//                        if  let JSON = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
//                            if let errorCode = JSON["errorcode"] as? String {
//                                if errorCode == "1"{
//                                    complition(JSON,1)
//                                    return
//                                }else{
//                                    DLHelper.ShowAlertError(message: JSON["msg"] as! String)
//                                }
//                            }
//                        }
//                    } catch {
//                        DLHelper.ShowAlertError(message: VALIDATION.dlkServer)
//                    }
//                }else{
//                    
//                    DLHelper.ShowAlertError(message: VALIDATION.dlkServer)
//                    
//                }
//                
//                
//            }
//            
//        })
//        task.resume()
//    }

    class func ShowAlertError(message:String){
     
        let alertController = UIAlertController(title: VALIDATION.dlkappname, message:message , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    func DLPlaceholderImage(image:UIImage?, imageView:UIImageView?,imgUrl:String,compate:@escaping (UIImage) -> Void){
        
        if image != nil && imageView != nil {
            imageView!.image = image!
        }
        
        var urlcatch = imgUrl.replacingOccurrences(of: "/", with: "#")
        let documentpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        urlcatch = documentpath + "/" + "\(urlcatch)"
        
        let image = UIImage(contentsOfFile:urlcatch)
        if image != nil && imageView != nil
        {
            imageView!.image = image!
            compate(image!)
            
        }else{
            
            if let url = NSURL(string:imgUrl){
                
                
                DispatchQueue.global(qos: .background).async {
                    () -> Void in
                    let imgdata = NSData(contentsOf: url as URL)
                    DispatchQueue.main.async {
                        () -> Void in
                        imgdata?.write(toFile: urlcatch, atomically: true)
                        let image = UIImage(contentsOfFile:urlcatch)
                        if image != nil  {
                            if imageView != nil  {
                                imageView!.image = image!
                            }
                            
                            compate(image!)
                        }
                        
                    }
                }
                
            }
            
            
            
            
        }
    }
    
       func CurrentlocationPermittion(){
        
//        self.locationManager.requestAlwaysAuthorization()
//        
//        self.locationManager.requestWhenInUseAuthorization()
//        
//        
//        
//        if CLLocationManager.locationServicesEnabled() {
//            
//            locationManager.delegate = self
//            
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            
//            locationManager.startUpdatingLocation()
//            
//        }
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        if let locValue = manager.location {
//            
//            
//            
//            latitude = "\(locValue.coordinate.latitude)"
//            
//            logitude = "\(locValue.coordinate.longitude)"
//            
//        }
        
        
        
    }
    
    
    
    
    func DLMultipleColourString(fullstring:String, wordArray:NSArray , colouArray:NSArray) -> NSMutableAttributedString{
        
        
        
        let atributeString = NSMutableAttributedString(string: fullstring)
        
        if wordArray.count == colouArray.count {
            
            
            
            for i  in  0 ..< wordArray.count {
                
                
                
                let range = (fullstring as NSString).range(of: wordArray[i]  as! String)
                
                atributeString.addAttribute(NSForegroundColorAttributeName, value: colouArray[i] as! UIColor , range: range)
                
                
                
            }
            
            
            
            
            
        }
        
        
        
        return atributeString
        
    }
    
    func DLDiscountPrice(string:String) -> NSAttributedString {
        
        
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: string)
        
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
        
    }
    
    
    
    func FacebookResult(){
        
        
        
        
        
        //        Twitter.sharedInstance().logInWithCompletion { (session , error) -> Void in
        
        //            if session != nil {
        
        //                // Here you have a valid session you can use.
        
        //                print(session!.userName)
        
        //            }
        
        //        }
        
        //
        
        //        //        Twitter.sharedInstance().logInWithCompletion { session, error in
        
        //        //            if (session != nil) {
        
        //        //                print("signed in as \(session.userName)");
        
        //        //            } else {
        
        //        //                print("error: \(error.localizedDescription)");
        
        //        //            }
        
        //        //        }
        
        //
        
        //        return
        
//        let login = FBSDKLoginManager()
//        
//        
//        
//        login.logInWithReadPermissions(["email","public_profile","user_work_history","user_friends"], fromViewController: self) { (result, error) in
//            
//            if error != nil {
//                
//                print ("Error")
//                
//            }else if result.isCancelled {
//                
//                print("cancel")
//                
//            }else{
//                
//                print("login" + "\n\(result)")
//                
//                if FBSDKAccessToken.currentAccessToken() != nil {
//                    
//                    
//                    
//                    let Request = FBSDKGraphRequest(graphPath:"me", parameters:["fields":"picture.type(large),link,first_name,email,last_name,work,middle_name,name,id,gender"],HTTPMethod:"GET" )
//                    
//                    
//                    
//                    Request.startWithCompletionHandler({ (connection, result, error) in
//                        
//                        
//                        
//                        if error != nil {
//                            
//                            print(error.localizedDescription)
//                            
//                        }else{
//                            
//                            let Result = result as! NSMutableDictionary
//                            
//                            let dict = Result.mutableCopy() as! NSMutableDictionary
//                            
//                            dict["fbAccessToken"] = FBSDKAccessToken.currentAccessToken().tokenString
//                            
//                            self.delegate?.FacebookResult?(dict)
//                            
//                        }
//                        
//                    })
//                    
//                    
//                    
//                }
//                
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//        
//        
//        
        
        
        
        
    }
}


