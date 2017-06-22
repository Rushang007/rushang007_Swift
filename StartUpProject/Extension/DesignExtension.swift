//
//  DesignExtension.swift
//  MychatApp
//
//  Created by mtpl on 29/04/17.
//  Copyright © 2017 mtpl. All rights reserved.
//




import UIKit
import Foundation
import AVFoundation

let imageCache = NSCache<AnyObject, AnyObject>()
let videoimageCache = NSCache<AnyObject, AnyObject>()
extension UITabBarController {
    func setupSwipeGestureRecognizers(allowCyclingThoughTabs cycleThroughTabs: Bool = false) {
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeLeftAllowingCyclingThroughTabs) : #selector(handleSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.tabBar.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeRightAllowingCyclingThroughTabs) : #selector(handleSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        self.tabBar.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    
    @objc fileprivate func handleSwipeLeft(_ swipe: UISwipeGestureRecognizer) {
        self.selectedIndex -= 1
    }
    
    @objc fileprivate func handleSwipeRight(_ swipe: UISwipeGestureRecognizer) {
        self.selectedIndex += 1
    }
    
    @objc fileprivate func handleSwipeLeftAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex - 1
        self.selectedIndex = nextIndex >= 0 ? nextIndex : maxIndex - 1
        
    }
    
    @objc fileprivate func handleSwipeRightAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex + 1
        self.selectedIndex = nextIndex < maxIndex ? nextIndex : 0
    }
}

extension UITableView
{
    
        func RemoveLongGestureRecognizers() {
            if let objects = self.gestureRecognizers {
                for object in objects {
                    if let gestureRecognizer = object as? UILongPressGestureRecognizer {
                        removeGestureRecognizer(gestureRecognizer)
                    }
                }
            }
        }
    
}
extension UIImage {
    
    
   
    enum JPEGQuality: CGFloat {
        case lowest  = 0.0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    var png: Data? { return UIImagePNGRepresentation(self) }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return UIImageJPEGRepresentation(self, quality.rawValue)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight ))
        
            image.draw(in: CGRect( x: 0, y: 0, width: newWidth, height: newHeight))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage
    
    }
    
    func compressImage (_ image: UIImage,width:CGFloat,Quality:CGFloat) -> UIImage {
        
        let actualHeight:CGFloat = image.size.height
        let actualWidth:CGFloat = image.size.width
        let imgRatio:CGFloat = actualWidth/actualHeight
        let maxWidth:CGFloat = width
        let resizedHeight:CGFloat = maxWidth/imgRatio
        let compressionQuality:CGFloat = Quality
        
        let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData:Data = UIImageJPEGRepresentation(img, compressionQuality)!
        UIGraphicsEndImageContext()
        
        return UIImage(data: imageData)!
        
    }
    

}
extension UIImageView {
    
   func saveimage()
   {
    //let imageData = UIImagePNGRepresentation(self.image!)
    //let compresedImage = UIImage(data: imageData!)
   
    //UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
    print("Image Save Successfully...")
  }
    
    func AddblurEffect(Ismove:Bool)
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        //blurEffectView.alpha = 0.5
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if Ismove
        {
            self.addSubview(blurEffectView)
        }
        else
        {
            blurEffectView.removeFromSuperview()
            
        }
        
    }
    
    func AddEffectGradient()
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [ UIColor.clear.cgColor , UIColor.black.cgColor]
        gradient.locations = [0.6]
                self.layer.addSublayer(gradient)
    }
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.black.cgColor
        self.contentMode = .scaleAspectFill
    }
    
    func LoadVideoImage(_ urlString: URL)
    {
        self.image = nil
        if let cachedImage = videoimageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            //completionHandler(true)
            return
        }
        let asset = AVAsset(url: urlString)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        do {
            
             let thumbnailCGImage = try imageGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
           
                    self.image = UIImage(cgImage: thumbnailCGImage)
            videoimageCache.setObject( self.image!, forKey: urlString as AnyObject)
            
            
            return
            
        } catch let err {
            print(err)
        }

    }
    
    func loadImageUsingCacheWithUrlString(_ urlString: String){
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            //completionHandler(true)
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if error != nil {
                print(error ?? "")
               // completionHandler(false)
                return
            }
            
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                    //completionHandler(true)
                }
            })
            
        }).resume()
    }
    
    

}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
extension UITextField {
    
    func underlined(Isline:Bool){
        if Isline{
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        else
        {
            self.layer.masksToBounds = false
        }
        
        
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 15.0),NSForegroundColorAttributeName : Utils.hexStringToUIColor(hex: "495164")]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
}
extension String
{
        func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidEmailidLength() -> Bool
    {
        if characters.count < 50
        {
            return true
        }
        return false
    }
    func isValidName() -> Bool {
        
        if characters.count > 0 {
            return true
        }
        return false
        
        
    }
    func isValidPassWord() -> Bool {
        
        if characters.count >= 6  {
            return true
        }
        return false
        
    }
    func isValidConformPassword(newpassword:String,conformpassword:String) -> Bool {
        
        var a = false
        var b = false
        
        if newpassword == conformpassword {
            
            a = true
            
        } else {
            
            //Passwords dont match
            return false
        }
        
        
        if a == true && b == true {
            
            //Signup code
            return true
        }
        return true
    }
    func isValidFullname() -> Bool {
        
        let emailRegEx = "^[A-Za-z]+(?:\\s[A-Za-z]+)"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
        
    }
    func isValidZipcode() -> Bool {
        
        if characters.count == 5 || characters.count == 6 {
            return true
        }
        return false
        
    }
    
    func isValidMobile() -> Bool {
        
        
        if characters.count == 10 {
            return true
        }
        return false
        
    }
    
    func isvalidindianno() -> Bool {
        //https://stackoverflow.com/questions/3813195/regular-expression-for-indian-mobile-numbers
        let mobnoRegEx = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[789]\\d{9}$"

        //"^[789]\\d{9}$"
        let mobnoRegExTest = NSPredicate(format:"SELF MATCHES %@", mobnoRegEx)
        return mobnoRegExTest.evaluate(with: self)
    }
    
    func isEmptyText() -> Bool {
        
        let string = self.trimmingCharacters(in: NSCharacterSet.whitespaces)
        return string.isEmpty
    }

    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    func fileName() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    func fileExtension() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
    

    
    
}

extension Notification.Name {
    public static let Logoutkey = Notification.Name(rawValue: "com.elitech.mychat.Logoutkey")
    
     public static let ChangeImageKey = Notification.Name(rawValue: "com.elitech.mychat.ChangeImageKey")
    
    public static let UpdateStatuskey = Notification.Name(rawValue: "com.elitech.mychat.UpdateStatuskey")
    
    public static let ReloadTableViewkey = Notification.Name(rawValue: "com.elitech.mychat.ReloadTableViewkey")
    
     public static let ReloadNewContactkey = Notification.Name(rawValue: "com.elitech.mychat.ReloadNewContactkey")
    
    
}

extension Date {
    func currentTimeZoneDate() -> String {
        let dtf = DateFormatter()
        dtf.timeZone = TimeZone.current
        dtf.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dtf.string(from: self)
    }
    
}

extension UIView {
    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}

extension Int64 {
    
    
    func RecentDate(timestamp:Int64) -> String
    {
       
        let Time = (timestamp/1000) - NSTimeZone.system.secondsFromGMT()
        let calendar = NSCalendar.current
        let date = Date(timeIntervalSince1970: TimeInterval(Time))
        
        if calendar.isDateInYesterday(date) { return "Yesterday" }
        else if calendar.isDateInToday(date)
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGTIME
            dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
            return dateFormatter.string(from: date)
        }
        //else if calendar.isDateInTomorrow(date) { return "Tomorrow" }
        else {
            
          
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = Constants.DATEFORMAT.RECENTMSGDATE
            dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
            return dateFormatter.string(from: date)
            
            //return startOfTimeStamp.currentTimeZoneDate()
            //            let day = components.day!
            //            if day < 1 { return "\(abs(day)) days ago" }
            //            else { return "In \(day) days" }
        }

        
//        let Time = (timestamp/1000) + NSTimeZone.system.secondsFromGMT()
//        let calendar = NSCalendar.current
//        let time_stamp:Double = ((Double(Time)))
//        let date = NSDate(timeIntervalSince1970: time_stamp)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        if calendar.isDateInYesterday(date as Date)
//        {
//            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGDATE
//            return "Yesterday"
//        }
//        if calendar.isDateInToday(date as Date)
//        {
//            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGTIME
//            return dateFormatter.string(from: date as Date)//"Today"
//        }
//        
//        else {
//            dateFormatter.dateFormat = Constants.DATEFORMAT.RECENTMSGDATE
//            
//            return dateFormatter.string(from: date as Date)
//            
//        }
    }

    func dayDifference(timestamp:Int64) -> String
    {
        let time = Double(timestamp)
        let time_stamp:Double = ((time) / 1000) - Double(NSTimeZone.local.secondsFromGMT())
        let calendar = NSCalendar.current
        let date = Date(timeIntervalSince1970: TimeInterval(time_stamp))
        if calendar.isDateInYesterday(date) { return "Yesterday" }
        else if calendar.isDateInToday(date) { return "Today" }
        else if calendar.isDateInTomorrow(date) { return "Tomorrow" }
        else {
//            let startOfNow = calendar.startOfDay(for: Date())
//            let startOfTimeStamp = calendar.startOfDay(for: date)
//            let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
//            let day = components.day!
//            if day < 1 { return "\(abs(day)) days ago" }
//            else { return "In \(day) days" }
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US")
                        dateFormatter.dateStyle = .medium
                        dateFormatter.dateFormat = Constants.DATEFORMAT.DATE
            
                        return dateFormatter.string(from: date)

        }
    }
//    func dayDifference(timestamp:Int64) -> String
//    {
//        let Time = (timestamp/1000) + NSTimeZone.system.secondsFromGMT()
//        let calendar = NSCalendar.current
//        let date = Date(timeIntervalSince1970: TimeInterval(Time))
//        if calendar.isDateInYesterday(date) { return "Yesterday" }
//        else if calendar.isDateInToday(date) { return "Today" }
////        else if calendar.isDateInTomorrow(date)
////        {
////            return "Tomorrow" }
//        else {
//            //let startOfNow = calendar.startOfDay(for: Date())
//           // let startOfTimeStamp = calendar.startOfDay(for: date)
//            //let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
//            let dateFormatter = DateFormatter()
//            //dateFormatter.locale = Locale(identifier: "en_US")
//            dateFormatter.dateStyle = .medium
//            dateFormatter.dateFormat = Constants.DATEFORMAT.DATE
//            
//            return dateFormatter.string(from: date)
//
//            //return startOfTimeStamp.currentTimeZoneDate()
////            let day = components.day!
////            if day < 1 { return "\(abs(day)) days ago" }
////            else { return "In \(day) days" }
//        }
//    }

    func getmediadatetime(timestamp:Int64) -> String
    {
        
        let time = Double(timestamp)
        let time_stamp:Double = ((time) / 1000) + Double(NSTimeZone.local.secondsFromGMT())
        
        let date = Date(timeIntervalSince1970: TimeInterval(Int(time_stamp)))
        //let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = Constants.DATEFORMAT.MEDIADATETIME
        dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
        return dateFormatter.string(from: date)
    }
    func dateFromMilliseconds() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self)/1000)
    }
    func getdatefromtimestamp(timestamp:Int64) -> String {
        
        let time = Double(timestamp)
        let time_stamp:Double = ((time) / 1000) + Double(NSTimeZone.local.secondsFromGMT())
        
        let date = Date(timeIntervalSince1970: TimeInterval(Int(time_stamp)))
        //let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = Constants.DATEFORMAT.MSGDATE
         dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
        return dateFormatter.string(from: date)
    }
    
    func gettimefromtimestamp(timestamp:Int64) -> String {
        
        let time = Double(timestamp)
        let time_stamp:Double = ((time) / 1000) - Double(NSTimeZone.system.secondsFromGMT())
        
        let date = Date(timeIntervalSince1970: TimeInterval(Int(time_stamp)))
        //let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = Constants.DATEFORMAT.MSGTIME
         dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: date)
    }
    
    func GetlastSeen(timestamp:Int64) -> String
    {
        print(timestamp)
       
        
      //  let currentDate = NSDate()
        
        let calendar = NSCalendar.current
       // let time = Double(timestamp)
        
        let Time = (timestamp/1000) - NSTimeZone.system.secondsFromGMT()
        let time_stamp:Double = ((Double(Time)))
        let date = NSDate(timeIntervalSince1970: time_stamp)
        print("Date",date)
        if calendar.isDateInYesterday(date as Date)
        {
            let dateFormatter = DateFormatter()
            //dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGTIME
             dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            
            //return dateFormatter.string(from: date)
            return "last seen yesterday at " +  dateFormatter.string(from: date as Date)
        }
        else if calendar.isDateInToday(date as Date)
        {
            
            let dateFormatter = DateFormatter()
            //dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGTIME
            //dateFormatter.timeZone = NSTimeZone.local.secondsFromGMT()
            dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            return "last seen today at " +  dateFormatter.string(from: date as Date)
            
            //return "Today"
        }
        else if calendar.isDateInTomorrow(date as Date) { return "Tomorrow" }
        else {
            //let startOfNow = calendar.startOfDay(for: Date())
            ///let startOfTimeStamp = calendar.startOfDay(for: date as Date)
            //let components = calendar.dateComponents([.weekday], from: startOfNow, to: startOfTimeStamp)
            let dateFormatter = DateFormatter()
            //dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = Constants.DATEFORMAT.MSGDATE
            dateFormatter.timeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone!
            
            
            return  "last seen at \(dateFormatter.string(from: date as Date))"
            
        }
    }
    

}




//Enums
enum ViewControllerType {
    case SplashScreenViewController
    case LoginViewController
    case RegisterViewController
    case RecentChatUserListViewController
    case ContactListViewController
    case SettingsViewController
    case RecentChatMenuViewController
    case ProfileViewController
    case ProfilePicEditViewController
    case UserStatusViewController
    case EditUserStatusViewController
    
}


enum PhotoSource {
    case library
    case camera
}

enum ShowExtraView {
    case contacts
    case profile
    case preview
    case map
}

enum MessageType {
    case photo
    case text
    case location
}

enum MessageOwner {
    case sender
    case receiver
}





