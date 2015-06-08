//
//  searcherLinksWebTests.m
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 06/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SearcherLinksWeb.h"
#import "common.h"

@interface searcherLinksWebTests : XCTestCase

@property (nonatomic) SearcherLinksWeb *searcherLinksWeb;
@property (nonatomic) NSRegularExpression * expressionHref;
@property (nonatomic) NSRegularExpression * expressionLink;
@end

@implementation searcherLinksWebTests

- (void)setUp {
    [super setUp];
    self.searcherLinksWeb = [[SearcherLinksWeb sharedInstance]init];
    self.expressionHref = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    self.expressionLink = [NSRegularExpression regularExpressionWithPattern:[common getExpresionRegularLinkHttp] options: NSRegularExpressionCaseInsensitive error:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
#pragma mark -- test searchMatchString --
-(void)testFindAhrefInString{
    NSString * aherfExample = @" <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">";
    NSRegularExpression * expressionHref = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    XCTAssertTrue([[self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:expressionHref] count] == 1);
}
-(void)testNotFindAhrefInString{
    NSString * aherfExample = @" <a class=\"branzfadsfasfa";
    NSRegularExpression * expressionHref = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    NSArray * array = [self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:expressionHref];
    XCTAssertTrue([array count] == 0);
}
-(void)testFind4AhrefInString{
    NSString * aherfExample = @" <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">                                         <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">   <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">  <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">    dsklfjaslfdjaslñfdas  <a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa";
    
    NSRegularExpression * expressionHref = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    NSArray * array = [self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:expressionHref];
    XCTAssertTrue([array count] == 4);
}
#pragma mark -- test getMatchesLink --
-(void)testFindLinkInAhrefString{
    NSString * aherfExample = @" <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">";
    NSArray * arrayMaches = [self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:self.expressionHref];
    NSArray * arrayMachesString = [self.searcherLinksWeb getArrayMatchs:arrayMaches StringUrlData:aherfExample];
    
    XCTAssertTrue([[self.searcherLinksWeb getMatchesLink:arrayMachesString RegularExpresionLink:self.expressionLink] count] == 1);
}
-(void)testNotFindLinkInAhrefString{
    NSString * aherfExample = @" <a class=\"branzfadsfasfa href=\"http://www.";
    NSArray * arrayMaches = [self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:self.expressionHref];
    NSArray * arrayMachesString = [self.searcherLinksWeb getArrayMatchs:arrayMaches StringUrlData:aherfExample];
    NSArray * arrayLinks= [self.searcherLinksWeb getMatchesLink:arrayMachesString RegularExpresionLink:self.expressionLink];
    XCTAssertTrue([ arrayLinks count] == 0);
}
-(void)testFind4LinksInAhrefString{
    NSString * aherfExample = @" <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">                                         <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">   <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">  <a class=\"brand\" href=\"http://www.visual-engin.com/Web/\">    dsklfjaslfdjaslñfdas  <a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa<a class=\"branzfadsfasfa";
    NSArray * arrayMaches = [self.searcherLinksWeb searchMatchString:aherfExample RegularExpressionHref:self.expressionHref];
    NSArray * arrayMachesString = [self.searcherLinksWeb getArrayMatchs:arrayMaches StringUrlData:aherfExample];
    XCTAssertTrue([[self.searcherLinksWeb getMatchesLink:arrayMachesString RegularExpresionLink:self.expressionLink] count] == 4);
}

@end
