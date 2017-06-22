//
//  DLTextView.swift
//  PreGame
//
//  Created by Moweb_10 on 16/08/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import UIKit

class DLTextView: UITextView,UITextViewDelegate {

    
    var Placehoder:UITextView? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUp()
    }
    func SetUp(){
        
        self.delegate = self
        if let txtview = viewWithTag(303030) as? UITextView{
            Placehoder = txtview
        }else{
            
            let txtview = UITextView(frame: self.frame)
            Placehoder = txtview
            self .addSubview(txtview)
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
        if textView.hasText {
            Placehoder?.isHidden = true
        }
        else{
            Placehoder?.isHidden = false
        }
    }
        
   
}
