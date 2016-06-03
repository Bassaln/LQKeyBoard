#### 解决键盘遮挡输入问题

```swift
class ViewController:LQKeyBoardDelegate{
  var textView:UITextView?
  override func viewDidLoad() {
      super.viewDidLoad()
      //textView初始化
      ....
      LQKeyBoard.registerKeyBoardShow(self)
      LQKeyBoard.registerKeyBoardHide(self)
  }
  
  func keyBoardWillHide(notification:NSNotification){
      self.textView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
  }
  func keyBoardWillShow(notification:NSNotification){
      let rect = LQKeyBoard.returnKeyBoardRect(by: notification)
      self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
  }

```

