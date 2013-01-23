//
//  NSString+HTMLHelper.h
//  NSString+HTMLHelper
//
//  Created by Angelo Villegas on 6/3/12.
//  Copyright (c) 2012 Studio Villegas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTMLHelper)

// class methods
+ (NSString *)mimeTypeFromURL:(NSURL *)pathForResource;
+ (NSString *)mimeTypeFromResource:(NSString *)pathForResource ofType:(NSString *)type;

// instance methods
- (NSString *)URLEncodeString;
- (NSString *)URLDecodeString;
- (NSString *)replaceTagWithLineBreak;
- (NSString *)replaceTagWithWhiteSpace;
- (NSString *)stripHTMLTags;

@end
