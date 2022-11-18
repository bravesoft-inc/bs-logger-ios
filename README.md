[日本語のREADMEはこちら](./README-ja.md)
# BSLogger
<img src="https://img.shields.io/badge/SPM-v1.0.0-blue.svg?logo=swift" />
<img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" />
<br><br>

[TOC]

## Overview
This is a library that is provided by [bravesoft](https://www.bravesoft.co.jp/) to output logs simply.

## Installation
This library can adapt to the project by using Swift Package Manager(SPM).
However, this library is a private repository due to only sharing to bravesoft group companies. So, after adapting by SPM, apply [these settings](#private-setting).


### Swift Package Manager
#### Requirements
-  Xcode 14.0.0 or later versions
- Check [Package.swift](./Package.swift) for letting you know the supported versions and platforms.
#### Install
##### Install From Xcode
Choose the project that you want to adapt bs_logger and click the `+` button at the lower left of the `Package Dependencies` tab.

![Installtion Image1](./Docs/images/install_1.png)

---

Put the repository URL at the search window of the upper right and search `bs_logger`
```console
https://gitlab.com/bs-libraries/bs_logger
```
![Installaton Image2](./Docs/images/install_2.png)

---

Next, Specify `Up to Next Manager Version` and `1.0.0` for the lowest version to `Dependency Rule` and click the `Add Package` button at the lower right of the dialog.

![Installation Image3](./Docs/images/install_3.png)

---

To install the library, keep choosing `BSLogger` and click the `Add Package` button.

![Installation Image4](./Docs/images/install_4.png)


### <a name="private-setting"></a>Settings of Private Repository
※Before open source, this section will be deleted

There is a way of settings for adapting the private repository's library into the project down below.

#### 1. SSH/Config File's Settings
Postscript the information of down below in `~/.ssh/Config` file on macOS. In addition to this, you need to write ssh Key's secretKey path which is registered by yourself at GitLab for IdentityFile's path.

```
Host gitlab.com.workteam
  HostName gitlab.com
  User git
  IdentityFile  ~/.ssh/id_rsa
  UseKeychain yes
  AddKeysToAgent yes
  PreferredAuthentications publickey
 
Host gitlab.com.hobby
  HostName gitlab.com
  User git
  IdentityFile  ~/.ssh/id_rsa
  UseKeychain yes
  AddKeysToAgent yes
  PreferredAuthentications publickey
```

#### 2. Issue GitLab's Access Token
Login [GitLab](https://gitlab.com/)

Next, click your own icon at the upper right and click `Edit profile`, then move to the `UserSettings` page.

![Issuing GitLab's Access Token1](./Docs/images/private_setting_1.png)

---

Click `Access Tokens` from the side menu and move to `Personal Access Tokens` page

![Issuing GitLab's Access Token2](./Docs/images/private_setting_2.png)

---

After the name token, put check `api` and `read_registry` from the authorization lists and click `Create personal access token` button to issue the access token. (set Expiration date if necessary)

![Issuing GitLab's Access Token3](./Docs/images/private_setting_3.png)

---

After issuing the token, `Your new personal access token` frame will be displayed and copy it to clipboard(※Token is displayed only one time.)

![Issuing GitLab's Access Token4](./Docs/images/private_setting_4.png)


#### 3. Login to GitLab on Xcode
Display the Xcode setting screen by clicking 'Xcode' → 'Preferences' at the menu bar.

![Login to GitLab on Xcode1](./Docs/images/xcode_1.png)

---

Open 'Accounts' Tab and click '+' at the lower left of the screen, then choose `GitLab.com`.

![Login to GitLab on Xcode2](./Docs/images/xcode_2.png)

Put the account name of GitLab and GitLab access token which you got at 2 to the form showing on display then your process to access the private repository is completed.
## Usage
### Initialization
Add the information down below when the app is started doing the start-up process.
Schemes like 'DEBUG・STAGING・RELESE' should be written by the Scheme name of being set at the project.

```swift
class AppDelegate : UIResponder, UIApplicationDelegate {
    func application(_application: UIApplication, 
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        #if DEBUG
          BSLogger.shared.startRun(environment: .develop)
        #elseif STAGING
          BSLogger.shared.startRun(environment: .staging)
        #else //RELEASE
          BSLogger.shared.startRun(environment: .production)
        #endif
        
        return true
    }
}
```

### Log Output
Use this function by switching methods as log level.
#### Log Output List
|Level|General Log Output|Variable Log Output|
|----|----|----|
|debug|`BSLogger.debug(Any)`|`hoge.log(level: .debug)`|
|info|`BSLogger.info(Any)`|`hoge.log(level: .info)`|
|warn|`BSLogger.warn(Any)`|`hoge.log(level: .warn)`|
|error|`BSLogger.error(Any)`|`hoge.log(level: .error)`|

#### Log Output sample
Here is a sample of General log output.
```swift
import BSLogger

actor MainViewModel: ObservableObject {
    func onTapButton() {
        BSLogger.debug("Button was tapped.")
        BSLogger.debug("Hello, world.", 1)
    }
}
```
Output result >
```console
[DEBUG] MainViewModel.onTapButton() #5: Button was tapped.
[DEBUG] MainViewModel.onTapButton() #6: Hello, world
[DEBUG] MainViewModel.onTapButton() #6: 1
```

---

Here is a sample of Directory doing log output.

```swift
import BSLogger

actor MainViewModel: ObservableObject {
    func onTapButton() {
        let text = "Button was tapped."

        text.log(level: .warn)
    }
}
```
Output result >
```console
[WARN] MainViewModel.onTapButton() #7: Button was tapped.
```

#### List of supported data type for Variable Log Output
##### Primitive data type
- String
- Int
- Double
- Float
- Bool
- Dictionary
- Array
- Date
- Error
- Int64
- UInt
- NSDictionary
- NSArray
##### UIKit
- CGFloat
- CGPoint
- CGSize
- CGRect
- CGAffineTransform
- UIEdgeInsets

### Measure The Processing Speed
We provide easy methods to use for the time when you want to measure the processing speed.

```swift
import BSLogger

BSLogger.timeCheck(key: "Time") {
    Thread.sleep(forTimeInterval: 5.0)
}
```

In addition to the above, you can use `async/await` supported methods if the project specifies iOS 13 or later for the lowest OS.
```swift
import BSLogger

BSLogger.timeCheck(key: "AsyncTime", task: .main) {
    try? await Task.sleep(nanoseconds: 500000)
}
```

### Deinit Log OutPut
We provide methods for when destroying an object.

```swift
import BSLogger

class Hoge {
    deinit {
        BSLogger.deinit()
    }
}
```
Output result >
```console
[DEINIT] Hoge deinit
```

## Demo 
[Demo](./Demo)
## License
※When opening the source, we add License information here.
