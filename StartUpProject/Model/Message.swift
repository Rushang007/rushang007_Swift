//
//  Message.swift
//  MychatApp
//
//  Created by mtpl on 10/05/17.
//  Copyright © 2017 mtpl. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Message{
    //MARK: Properties
    var name: String?
    var msg: String?
    var msg_status: String?
    var msg_type: String?
    var timestamp: Int64?
    var progress:Int?
    var profile_pic:String?
    var fromuid:String?
    var fromname:String?
    var msd_uid:String?
    var msgimage_url:String?
    var thumb:String?
    var downloaded:Bool?
    var msgsenttime:Int64?
    var delete:String?
    var filename:String?

    init(){
        
    }
    
    init(dictionary: [String: Any],msguid:String) {
        self.name = dictionary[Constants.KEYWORD.USERNAME] as? String
        self.fromuid = dictionary[Constants.KEYWORD.FROMUID] as? String
        self.fromname = dictionary[Constants.KEYWORD.FROMNAME] as? String
        self.msg = dictionary[Constants.KEYWORD.MESSAGE] as? String
        self.msg_status = dictionary[Constants.KEYWORD.MSGSTATUS] as? String
         self.timestamp = dictionary[Constants.KEYWORD.TIMESTAMP] as? Int64
        self.msg_type = dictionary[Constants.KEYWORD.MSGTYPE] as? String
        self.progress = dictionary[Constants.KEYWORD.PROGRESS] as? Int
        self.profile_pic = dictionary[Constants.KEYWORD.PROFILEPICURL] as? String
        self.msd_uid = msguid as? String
        self.msgimage_url = dictionary[Constants.KEYWORD.MSGURL] as? String
        self.thumb = dictionary[Constants.KEYWORD.THUMB] as? String
        self.downloaded = dictionary[Constants.KEYWORD.MSGDOWNLOADED] as? Bool
        
        self.msgsenttime = dictionary[Constants.KEYWORD.MSGSENTTIME] as? Int64
        
        self.delete = dictionary[Constants.KEYWORD.DELETE] as? String
        self.filename = dictionary[Constants.KEYWORD.FILE_NAME] as? String
    }

}
