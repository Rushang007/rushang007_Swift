//
//  User.swift
//  MychatApp
//
//  Created by mtpl on 01/05/17.
//  Copyright © 2017 mtpl. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class User: NSObject,NSCoding
{
    //MARK: Properties

    
    let name: String?
    let email: String?
    let mobileno: String?
    let id: String?
    let devicetype:String?
    var profilePic: String?
    var status:String?
    var statustime:Int64?
    var logintype:String = "Social"
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary[Constants.KEYWORD.USERNAME] as? String
        self.email = dictionary[Constants.KEYWORD.EMAIL] as? String
        self.id = dictionary[Constants.KEYWORD.UID] as? String
        self.devicetype = dictionary[Constants.KEYWORD.DEVICETYPE] as? String
        self.mobileno = dictionary[Constants.KEYWORD.MOBILENO] as? String
        self.profilePic = dictionary[Constants.KEYWORD.PROFILEPICURL] as? String
        self.status = dictionary[Constants.KEYWORD.STATUS] as? String
        self.statustime = dictionary[Constants.KEYWORD.STATUSTIME] as? Int64
    }
    
    required init(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.email = aDecoder.decodeObject(forKey: "email") as? String
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.devicetype = aDecoder.decodeObject(forKey: "devicetype") as? String
        self.mobileno = aDecoder.decodeObject(forKey: "mobileno") as? String
        self.profilePic = aDecoder.decodeObject(forKey: "profilePic") as? String
        self.status = aDecoder.decodeObject(forKey: "status") as? String
        self.statustime = aDecoder.decodeObject(forKey: "statustime") as? Int64
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(devicetype, forKey: "devicetype")
        aCoder.encode(mobileno, forKey: "mobileno")
        aCoder.encode(profilePic, forKey: "profilePic")
        aCoder.encode(status, forKey: "status")
        aCoder.encode(statustime, forKey: "statustime")
        
    }

}

class To_User: NSObject
{
    //MARK: Properties
    
    
    let name: String?
    let email: String?
    let mobileno: String?
    let id: String?
    let devicetype:String?
    var profilePic: String?
    var status:String?
    var statustime:Int64?
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary[Constants.KEYWORD.USERNAME] as? String
        self.email = dictionary[Constants.KEYWORD.EMAIL] as? String
        self.id = dictionary[Constants.KEYWORD.UID] as? String
        self.devicetype = dictionary[Constants.KEYWORD.DEVICETYPE] as? String
        self.mobileno = dictionary[Constants.KEYWORD.MOBILENO] as? String
        self.profilePic = dictionary[Constants.KEYWORD.PROFILEPICURL] as? String
        self.status = dictionary[Constants.KEYWORD.STATUS] as? String
        self.statustime = dictionary[Constants.KEYWORD.STATUSTIME] as? Int64
    }
    
}

