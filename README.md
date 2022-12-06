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
