//
//  DLLable.swift
//  PreGame
//
//  Created by Moweb_10 on 19/07/16.
//  Copyright © 2016 Moweb_10. All rights reserved.
//

import UIKit

class DLLable: UILabel {

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    var textInsets = UIEdgeInsets.zero {
//        didSet { invalidateIntrinsicContentSize() }
//    }
//    
//    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
//        let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
//        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
//        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
//                                          left: -textInsets.left,
//                                          bottom: -textInsets.bottom,
//                                          right: -textInsets.right)
//        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
//    }
//    
//    override func drawText(in rect: CGRect) {
//        super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
//    }

    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }


}



