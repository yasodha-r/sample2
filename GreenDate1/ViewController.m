//
//  ViewController.m
//  GreenDate1
//
//  Created by 3Edge on 12/07/13.
//  Copyright (c) 2013 3Edge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *exampleString =@"	<a href=\"http://www.mobile.safilsunny.com\"><img src=\"http://www.mobile.safilsunny.com/wp-content/themes/Polished/images/logo.png\" alt=\"Logo\" id=\"logo\"/></a>";
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *imgUrl =[self getImgUrl:exampleString];
    
    NSLog(imgUrl);
    
     
   
}


-(NSString *)getImgUrl:(NSString *)inputString{
    
    NSString *url = nil;
    NSString *s1,*s2,*S3,*s4;
    NSString *htmlString = inputString;
    
    //NSString *htmlString = @"dsfsdfjsgdfj^asdfasf";

    NSScanner *theScanner = [NSScanner scannerWithString:htmlString];
    //  
    [theScanner scanUpToString:@"" intoString:&s1];
    //getting crash here. when you pass NULL or nil value.
    [theScanner scanUpToString:NULL intoString:NULL];
   
    // find start of IMG tag
    [theScanner scanUpToString:@"<img " intoString:&s1];
    if (![theScanner isAtEnd]) {
        [theScanner scanUpToString:@"src" intoString:&s2];
        NSCharacterSet *charset = [NSCharacterSet characterSetWithCharactersInString:@"\"'"];
        [theScanner scanUpToCharactersFromSet:charset intoString:&S3];
        [theScanner scanCharactersFromSet:charset intoString:&s4];
        [theScanner scanUpToCharactersFromSet:charset intoString:&url];
        
    }
    if (url.length!=0) {
        
        return url;
        
    }
    else{
        
        return @"no Image Tag";
        
    }

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
