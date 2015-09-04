//
//  RoundImageView.swift
//  RainChat
//
//  Created by mackbook on 15/8/4.
//  Copyright (c) 2015年 utaustin. All rights reserved.


import UIKit
@IBDesignable
class RoundImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
}
