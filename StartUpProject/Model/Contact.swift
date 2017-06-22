//
//  Contact.swift
//  MychatApp
//
//  Created by mtpl on 01/05/17.
//  Copyright © 2017 mtpl. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Contact: NSObject
{
    //MARK: Properties
    let name: String?
    let email: String?
    let mobileno: String?
    let uid: String?
    let devicetype:String?
    var profilePic: String?
    let user_timestamp:Int64?
    var status:String?
    
    init(dictionary: [String: Any],key:String) {
                self.name = dictionary[Constants.KEYWORD.USERNAME] as? String
                self.email = dictionary[Constants.KEYWORD.EMAIL] as? String
                self.uid = key
                self.devicetype = dictionary[Constants.KEYWORD.DEVICETYPE] as? String
                self.mobileno = dictionary[Constants.KEYWORD.MOBILENO] as? String
                self.profilePic = dictionary[Constants.KEYWORD.PROFILEPICURL] as? String
        self.user_timestamp = dictionary[Constants.KEYWORD.USER_TIMESTAMP] as? Int64
        self.status = dictionary[Constants.KEYWORD.STATUS] as? String
    }

}

class RecentContact: NSObject
{
    
    //MARK: Properties
    let name: String?
    let lastmsg: String?
    let msgstatus: String?
    let uid: String?
    let msgtype:String?
    var profile_pic: String?
    let timestamp:Int64?
    let user_timestamp:Int64?
    let istyping:Bool?
    let fromid:String?
    let unread_msg_count:Int?
    let token:String?
    let msg_uid:String?

    init(dictionary: [String: Any],key:String) {
            self.fromid = dictionary[Constants.KEYWORD.FROMUID] as? String
                self.name = dictionary[Constants.KEYWORD.NAME] as? String
                self.lastmsg = dictionary[Constants.KEYWORD.LASTMSG] as? String
                self.uid = key
                self.msgstatus = dictionary[Constants.KEYWORD.MSGSTATUS] as? String
                self.msgtype = dictionary[Constants.KEYWORD.MSGTYPE] as? String
                self.profile_pic = dictionary[Constants.KEYWORD.PROFILEPICURL] as? String
                self.timestamp = dictionary[Constants.KEYWORD.TIMESTAMP] as? Int64
            self.user_timestamp = dictionary[Constants.KEYWORD.USER_TIMESTAMP] as? Int64
        self.istyping = dictionary[Constants.KEYWORD.ISTYPEING] as? Bool
        self.unread_msg_count = dictionary[Constants.KEYWORD.UNREADMSGCOUNT] as? Int
        self.token = dictionary[Constants.KEYWORD.TOKEN] as? String
        self.msg_uid = dictionary[Constants.KEYWORD.MSGUID] as? String
    }

    
}


