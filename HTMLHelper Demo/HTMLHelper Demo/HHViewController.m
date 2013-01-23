//
//  HHViewController.m
//  HTMLHelper Demo
//
//  Created by Angelo Villegas on 1/23/13.
//  Copyright (c) 2013 Studio Villegas. All rights reserved.
//

#import "HHViewController.h"
#import "NSString+HTMLHelper.h"

static NSString *URL = @"http://www.imdb.com/xml/find?json=1&q=";
static NSString *query = @"game of thrones";
static NSString *sampleLineBreak = @"This is a sample<br />line break";

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// URL encode and decode
	NSString *encodedQuery = [query URLEncodeString];
	NSString *encodedURL = [URL stringByAppendingString: encodedQuery];
	NSString *decodedURL = [encodedURL URLDecodeString];
	
	NSLog( @"encoded URL: %@" , encodedURL );
	NSLog( @"decoded URL: %@" , decodedURL );
	
	NSURL *URL = [NSURL URLWithString: encodedURL];
	NSURLRequest *URLRequest = [NSURLRequest requestWithURL: URL];
	NSError *error = nil;
	NSURLResponse *response = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest: URLRequest returningResponse: &response error: &error];
	NSLog( @"error: %@" , [error localizedDescription] );
	NSLog( @"response: %@" , response );
	NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
	NSLog( @"json data string: %@" , string );
	
	// replace line breaks
	NSLog( @"line break tag demo: %@" , [sampleLineBreak replaceTagWithLineBreak] );
	
	// replace line breaks with whitespace
	NSLog( @"line break whitespace demo: %@" , [sampleLineBreak replaceTagWithWhiteSpace] );
	
	// string HTML tags
	NSLog( @"%s" , __FUNCTION__ );
	NSLog( @"HTML tags demo: %@" , [sampleLineBreak stripHTMLTags] );
	
	// getting mime type from local file
	NSLog( @"mime type from local: %@" , [NSString mimeTypeFromResource: @"iphoneappprogrammingguide" ofType: @"pdf"] );
	
	// getting mime type from source URL
	NSURL *URLMime = [NSURL URLWithString: @"http://www.studiovillegas.com/"];
	NSLog( @"mime type from URL: %@" , [NSString mimeTypeFromURL: URLMime] );
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
