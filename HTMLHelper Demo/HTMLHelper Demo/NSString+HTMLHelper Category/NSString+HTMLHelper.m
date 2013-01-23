//
//  NSString+HTMLHelper.m
//  NSString+HTMLHelper
//
//  Created by Angelo Villegas on 6/3/12.
//  Copyright (c) 2012 Studio Villegas. All rights reserved.
//

#import "NSString+HTMLHelper.h"

@implementation NSString (HTMLHelper)

+ (NSString *)mimeTypeFromURL:(NSURL *)pathForResource
{
	NSURLRequest *fileUrlRequest = [NSURLRequest requestWithURL: pathForResource];
	
	NSError *error = nil;
	NSURLResponse *response = nil;
	[NSURLConnection sendSynchronousRequest: fileUrlRequest returningResponse: &response error: &error];
	
	NSString *mimeType = [response MIMEType];
	
	return mimeType;
}

+ (NSString *)mimeTypeFromResource:(NSString *)pathForResource ofType:(NSString *)type
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource: pathForResource ofType: type];
	NSString *fullPath = [filePath stringByExpandingTildeInPath];
	NSURL *fileUrl = [NSURL fileURLWithPath: fullPath];
	
	NSString *mimeType = [[self class] mimeTypeFromURL: fileUrl];
	return mimeType;
}

- (NSString *)URLEncodeString;
{
	CFStringRef URLstring = CFURLCreateStringByAddingPercentEscapes( NULL , (CFStringRef)self , NULL , (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% " , kCFStringEncodingUTF8 );
	NSString *string = (__bridge NSString *)URLstring;
    return string;
}

- (NSString *)URLDecodeString
{
    NSString *string = [self stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    return string;
}

- (NSString *)replaceTagWithLineBreak
{
	NSString *stringReplaced = [self stringByReplacingOccurrencesOfString: @"<br>" withString: @"\n"];
	stringReplaced = [stringReplaced stringByReplacingOccurrencesOfString: @"<br />" withString: @"\n"];
	
	return stringReplaced;
}

- (NSString *)replaceTagWithWhiteSpace
{
	NSString *stringReplaced = [self stringByReplacingOccurrencesOfString: @"<br>" withString: @" "];
	stringReplaced = [stringReplaced stringByReplacingOccurrencesOfString: @"<br />" withString: @" "];
	
	return stringReplaced;
}

- (NSString *)stripHTMLTags
{
	NSRange range;
	NSString *string = [self copy];
	
	while ((range = [string rangeOfString: @"<[^>]+>" options: NSRegularExpressionSearch]).location != NSNotFound)
	{
		string = [string stringByReplacingCharactersInRange: range withString: @""];
	}
	
	return string;
}

@end
