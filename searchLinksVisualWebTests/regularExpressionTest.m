//
//  regularExpressionTest.m
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 06/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "common.h"

@interface regularExpressionTest : XCTestCase

@end

@implementation regularExpressionTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
#pragma mark text Expression regular for <a hfref="..."><\a>
-(void)testExpressionIsOneAhref{
    NSString * stringAhrefExample =@"<A HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>";
    NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringAhrefExample options:0 range:NSMakeRange(0, [stringAhrefExample length])];
    XCTAssertNotNil(match,@"Pass");
    
}
-(void)testExpressionNotIsOneAhref{
    NSString * stringAhrefExample =@"<HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>";
    NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringAhrefExample options:0 range:NSMakeRange(0, [stringAhrefExample length])];
    XCTAssert([match count] == 0,@"Pass");
    
}
-(void)testExpresionThereAre4Ahref{
    NSString * stringAhrefExample =@"<<HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>HREF=\"http://www.htmlpo<HRE<HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>F=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>int.com\">Visita HTMLpoint</A>                                                                          <A clsasds = \"dasfasa\" HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>                                                              <A  clsasds = \"dasfasa\" HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>                                                               <A HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A>                                                              <A HREF=\"http://www.htmlpoint.com\">Visita HTMLpoint</A> ";
    NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringAhrefExample options:0 range:NSMakeRange(0, [stringAhrefExample length])];
    XCTAssert([match count] == 4,@"Pass");
}

#pragma mark text Expression regular for "http://website.com"
-(void)testExpressionNotIsOneHttp{
    NSString * stringHttpExample = @"ht//www.visual-engin";
    NSRegularExpression * expression= [NSRegularExpression regularExpressionWithPattern:[common getExpresionRegularLinkHttp] options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringHttpExample options:0 range:NSMakeRange(0, [stringHttpExample length])];
    XCTAssert([match count] == 0,@"Pass");

}
-(void)testExpressionIsOneHttp{
    NSString * stringHttpExample = @"http://www.visual-engin.com/Web/en/clientes/";
    NSRegularExpression * expression= [NSRegularExpression regularExpressionWithPattern:[common getExpresionRegularLinkHttp] options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringHttpExample options:0 range:NSMakeRange(0, [stringHttpExample length])];
    XCTAssertNotNil(match,@"Pass");
}
-(void)testExpressionThereAre4Http{
    NSString * stringHttpExample = @"ht//www.visuht//www.visual-enginal-ehht//www.visual-engint//www.visual-enginnginht//www.visual-enginht//www.visual-engin     http://www.visual-engin.com/Web/en/clientes/ http://www.visual-engin.com/Web/en/clientes/ http://www.visual-engin.com/Web/en/clientes/ http://www.visual-engin.com/Web/en/clientes/";
    NSRegularExpression * expression= [NSRegularExpression regularExpressionWithPattern:[common getExpresionRegularLinkHttp] options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * match = [expression matchesInString:stringHttpExample options:0 range:NSMakeRange(0, [stringHttpExample length])];
    XCTAssert([match count] == 4,@"Pass");
    
}


@end
