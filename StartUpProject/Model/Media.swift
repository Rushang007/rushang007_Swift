//
//  Media.swift
//  MychatApp
//
//  Created by mtpl on 25/05/17.
//  Copyright © 2017 mtpl. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Media:Object
{
    dynamic var id = ""
    dynamic var msg_key = ""
    dynamic var file_name = ""
    dynamic var from_uid = ""
    dynamic var from_name = ""
    dynamic var url = ""
    dynamic var video_url = ""
    dynamic var msg_sent_time:Int64 = 0
    dynamic var channel_id = ""
    dynamic var msg_type = ""
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    convenience init(id:String,msg_key:String,file_name: String, from_uid: String,from_name:String, url: String,video_url:String,msg_sent_time:Int64,channel_id:String,msg_type:String) {
        self.init()
        
        self.id = id
        self.msg_key = msg_key
        self.file_name = file_name
        self.from_uid = from_uid
        self.from_name = from_name
        self.url = url
        self.video_url = video_url
        self.msg_sent_time = msg_sent_time
        self.channel_id = channel_id
        self.msg_type = msg_type
    }
}

class MediaView: Object {
    var MediaViewList = List<Media>()
}

