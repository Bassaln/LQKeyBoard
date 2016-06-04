#### 解决键盘遮挡输入问题

######Demo

#######注册键盘的出现/隐藏
```swift
class ViewController{
  var textView:UITextView?
  override func viewDidLoad() {
      super.viewDidLoad()
      //textView初始化
      ....
      LQKeyBoard.registerKeyBoardShow(self)
      LQKeyBoard.registerKeyBoardHide(self)
  }
```
#######遵循协议并实现协议中的方法
```swift
extension ViewController:LQKeyBoardDelegate{
    //键盘隐藏
    func keyBoardWillHide(notification:NSNotification){
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    //键盘出现
    func keyBoardWillShow(notification:NSNotification){
        let rect = LQKeyBoard.returnKeyBoardRect(by: notification)
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
    }
}
```

![image](https://github.com/Bassaln/files/blob/master/files.png)

