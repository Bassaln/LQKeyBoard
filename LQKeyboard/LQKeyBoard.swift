//
//  LQKeyBoard.swift
//  LQKeyBoard
//
//  Created by 大可立青 on 16/6/3.
//  Copyright © 2016年 dklq. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LQKeyBoardDelegate{
    func keyBoardWillShow(notification:NSNotification)
    func keyBoardWillHide(notification:NSNotification)
}

private extension Selector{
    static let keyBoardWillShow = #selector(LQKeyBoardDelegate.keyBoardWillShow(_:))
    static let keyBoardWillHide = #selector(LQKeyBoardDelegate.keyBoardWillHide(_:))
}

class LQKeyBoard:NSObject{
    //注册键盘出现
    class func registerKeyBoardShow(target:AnyObject){
        NSNotificationCenter.defaultCenter().addObserver(target, selector: Selector.keyBoardWillShow, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    //注册键盘消失
    class func registerKeyBoardHide(target:AnyObject){
        NSNotificationCenter.defaultCenter().addObserver(target, selector: Selector.keyBoardWillHide, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    //返回键盘Rect
    class func returnKeyBoardRect(by notification:NSNotification)->CGRect{
        return notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
    }
    
    //返回键盘动画持续时间
    class func returnKeyBoardDuration(by notification:NSNotification)->Double{
        return notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
    }
    
    //返回键盘动画曲线
    class func returnKeyBoardAnimationCurve(by notification:NSNotification)->UIViewAnimationCurve{
        return notification.userInfo![UIKeyboardAnimationCurveUserInfoKey]!.completionCurve()
    }
}
