# generator-ios

iOS project generator for self-use.

## Install

```
git clone https://github.com/hustlzp/generator-ios
npm install -g yo
npm link
```

## Usage

```
yo ios
pod init
```

## CocoaPods

```
pod 'SnapKit'
pod 'Fabric'
pod 'Crashlytics'
pod 'Alamofire'
pod 'ionicons'
pod 'MBProgressHUD'
pod 'UMengUShare'
pod 'MJRefresh'
pod 'AVOSCloud'
```

## Other Codes

In `application:didFinishLaunchingWithOptions:`:

```swift
window = UIWindow(frame: UIScreen.main.bounds)
window!.rootViewController = ViewController()
window!.backgroundColor = UIColor.white
window!.makeKeyAndVisible()

return true
```