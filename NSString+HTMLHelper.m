//
//  NSString+HTMLHelper.m
//  NSString+HTMLHelper
//
//  Created by Angelo Villegas on 6/3/12.
//  Copyright (c) 2012 Studio Villegas. All rights reserved.
//

#import "NSString+HTMLHelper.h"

@implementation NSString (HTMLHelper)

+ (NSString *)URLEncodeString:(NSString *)stringURL
{
	CFStringRef URLstring = CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)stringURL, NULL, (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ", kCFStringEncodingUTF8);
    return [(NSString *)URLstring autorelease];
}

+ (NSString *)URLDecodeString:(NSString *)stringURL
{
    // NSString *string = [stringURL stringByReplacingOccurrencesOfString: @"+" withString: @" "];
    NSString *string = [stringURL stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    return string;
}

+ (NSString *)replaceTagWithLineBreak:(NSString *)string
{
	NSString *stringReplaced = [string stringByReplacingOccurrencesOfString: @"<br>" withString: @"\n"];
	
	return stringReplaced;
}

- (NSString *)replaceTagWithWhiteSpace
{
	NSString *stringReplaced = [self stringByReplacingOccurrencesOfString: @"<br>" withString: @" "];
	
	return stringReplaced;
}

- (NSString *)stripHTMLTags
{
	NSRange range;
	NSString *string = [[self copy] autorelease];
	
	while ((range = [string rangeOfString: @"<[^>]+>" options: NSRegularExpressionSearch]).location != NSNotFound)
	{
		string = [string stringByReplacingCharactersInRange: range withString: @""];
	}
	
	return string;
}

- (NSString *)mimeTypeFromResource:(NSString *)pathForResource ofType:(NSString *)type
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource: pathForResource ofType: type];
	NSString *fullPath = [filePath stringByExpandingTildeInPath];
	NSURL *fileUrl = [NSURL fileURLWithPath: fullPath];
	NSURLRequest *fileUrlRequest = [[NSURLRequest alloc] initWithURL: fileUrl cachePolicy: NSURLCacheStorageNotAllowed timeoutInterval: .1];
	
	NSError *error = nil;
	NSURLResponse *response = nil;
	[NSURLConnection sendSynchronousRequest: fileUrlRequest returningResponse: &response error: &error];
	
	NSString *mimeType = [response MIMEType];
	
	[fileUrlRequest release];
	
	return mimeType;
}

@end
