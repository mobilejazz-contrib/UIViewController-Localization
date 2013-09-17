#UIViewController-Localization

This category expands the UIViewController behavior to translate automatically the controller main view and its subviews after being loaded from the nib file.

It helps speeding up the process of translating nibs. With this category, you just need to use the localizable key for your views and it will be replaced by the translation if itcan be found on the app strings file. There's no more need to add IBOutlets for translating purposes!


##Installation and usage

1. Add [`UIViewController+Localization.h`](https://github.com/mobilejazz/UIViewController-Localization/blob/master/UIViewController%2BLocalization.h) and [`UIViewController+Localization.m`](https://github.com/mobilejazz/UIViewController-Localization/blob/master/UIViewController%2BLocalization.m)
2. Add this line to your Prefix.pch file

  ```objective-c
  #import "UIViewController+Localization.h" 
  ```

3. That's it, you can now start using keys from your strings file on Interface Builder.

##Currently supported UIKit classes

- **UILabel**: It translates the `text` property.
- **UIButton**: It translates the `text` property of the `titleLabel` property.
- **UITextField**: It translates the `placeholder` property.
