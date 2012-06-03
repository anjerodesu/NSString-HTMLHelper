//
//  NSString+HTMLHelper.h
//  NSString+HTMLHelper
//
//  Created by Angelo Villegas on 6/3/12.
//  Copyright (c) 2012 Studio Villegas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTMLHelper)

+ (NSString *)URLEncodeString:(NSString *)stringURL;
+ (NSString *)URLDecodeString:(NSString *)stringURL;
+ (NSString *)replaceTagWithLineBreak:(NSString *)string;

- (NSString *)replaceTagWithWhiteSpace;
- (NSString *)stripHTMLTags;
- (NSString *)mimeTypeFromResource:(NSString *)pathForResource ofType:(NSString *)type;

@end
