ChFunctionalArrayAdditions
===========

Convenience methods on NSString such as `isValidEmail` and `asWords` that make working with strings easier.

Whats in here?
===========
Mostly convenience methods that make common operations easier. Methods to check if the string is blank, valid and if a string represents a valid email address.

Usage
===========
Here are some examples of use cases for the provided methods.

```
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {    
    self.canLogin = textField.text.isValidEmail;
    return YES;
}
```

`NSArray *words = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil].asWords;`

There are a few other methods such as `asLines` and `asSentences` as well.

Installation
===========
CHStringAdditions uses [cocoapods](http://cocoapods.org), though it requires a few steps since it is using the private [ChaiKit-Specs](https://github.com/chaione/ChaiKit-Specs) repo, so a few additional steps are required to be able to pull it in, which you can find [here](http://guides.cocoapods.org/making/private-cocoapods.html). Once that is done just put `pod 'CHStringAdditions' :head` into your podfile and install like normal. then just `#import "CHStringAdditions/CHStringAdditions.h"` wherever you want to use it.

Contributing
===========
Contributions and improvements are welcome. Just fork the project and submit a pull request. Make sure you check out the [contributing document](http://github.com/chaione/CHStringAdditions/blob/master/CONTRIBUTING.md) first.
