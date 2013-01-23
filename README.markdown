HTMLHelper
=

NSString+HTMLHelper is a collection of methods that helps me deal with HTML tags and URLs. 

Methods
-
#### Class Methods
+ + (NSString *)mimeTypeFromURL:(NSURL *)pathForResource;
+ + (NSString *)mimeTypeFromResource:(NSString *)pathForResource ofType:(NSString *)type;

#### Instance Methods
+ - (NSString *)URLEncodeString;
+ - (NSString *)URLDecodeString;
+ - (NSString *)replaceTagWithLineBreak;
+ - (NSString *)replaceTagWithWhiteSpace;
+ - (NSString *)stripHTMLTags;

Install
-
Just copy the `NSString+HTMLHelper Category` or `NSString+HTMLHelper.h` and `NSString+HTMLHelper.m` files to your project and `#import` the header file `NSString+HTMLHelper.h`

License
-
HTMLHelper is available under the [MIT license](https://github.com/anjerodesu/NSString-HTMLHelper/blob/master/LICENSE "LICENSE").