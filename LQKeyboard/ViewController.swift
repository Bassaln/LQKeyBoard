//
//  ViewController.swift
//  LQKeyBoard
//
//  Created by 大可立青 on 16/6/3.
//  Copyright © 2016年 dklq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textView:UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        textView = UITextView(frame: CGRectMake(10, 20, UIScreen.mainScreen().bounds.width-20, UIScreen.mainScreen().bounds.height-40))
        self.view.addSubview(textView!)
        textView?.font = UIFont.systemFontOfSize(20)
        textView?.becomeFirstResponder()
        textView?.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textView?.tintColor = UIColor.grayColor()
        
        LQKeyBoard.registerKeyBoardShow(self)
        LQKeyBoard.registerKeyBoardHide(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:LQKeyBoardDelegate{
    /**
     *  键盘遮挡
     */
    func keyBoardWillHide(notification:NSNotification){
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func keyBoardWillShow(notification:NSNotification){
        let rect = LQKeyBoard.returnKeyBoardRect(by: notification)
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
    }
}

