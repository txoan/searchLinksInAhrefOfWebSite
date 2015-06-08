//
//  SearcherLinksWeb.m
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 04/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import "SearcherLinksWeb.h"
#import "common.h"
@implementation SearcherLinksWeb{

    NSString * urlDataStr;
    NSRegularExpression * expressionHref;
    NSRegularExpression * expresionLink;
    NSArray * matches;
    NSArray * matchesStrings;
    NSArray * links;
}

#pragma mark - singleton Pattern
- (id)init{
    self = [super init];
    if (self) {
        expressionHref = [NSRegularExpression regularExpressionWithPattern:[common getExpressionRegularAherf] options: NSRegularExpressionCaseInsensitive error:nil];
        expresionLink = [NSRegularExpression regularExpressionWithPattern:[common getExpresionRegularLinkHttp] options:NSRegularExpressionCaseInsensitive error:nil];
        [self process];
    }
    return self;
}
+ (SearcherLinksWeb*)sharedInstance{
    static SearcherLinksWeb *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[SearcherLinksWeb alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - methods for search links("<a href=") of the website
/**
 This method contains all the necessary methods to perform the search process and at the end this results in a corresponding array.
 */
-(void)process{
    urlDataStr= [self downloadWeb:[common getUrlWebsite]];
    matches = [self searchMatchString:urlDataStr RegularExpressionHref:expressionHref];
    matchesStrings = [self getArrayMatchs:matches StringUrlData:urlDataStr];
    links = [self getMatchesLink:matchesStrings RegularExpresionLink:expresionLink];
}
-(NSString*)downloadWeb:(NSString*)urlWebsite{
    NSURL *url = [NSURL URLWithString:urlWebsite];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    NSString * urlDataString = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
    return urlDataString;
}
-(NSArray*)searchMatchString:(NSString*)string RegularExpressionHref:(NSRegularExpression*)regularExpressionHref{
    return [regularExpressionHref matchesInString:string options:0 range:NSMakeRange(0, [string length])];
}
-(NSArray*)getArrayMatchs:(NSArray*)matchesAhref StringUrlData:(NSString*)urlDataString{
    NSMutableArray *arrayOfAhrefWithLinks = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *match in matchesAhref) {
        NSString* substringForMatch = [urlDataString substringWithRange:match.range];
        [arrayOfAhrefWithLinks addObject:substringForMatch];
    }
    return [NSArray arrayWithArray:arrayOfAhrefWithLinks];
}
-(NSArray*)getMatchesLink:(NSArray*)matchesHrefString RegularExpresionLink:(NSRegularExpression*)expressionRegularlink{
    NSMutableArray * allLinks = [[NSMutableArray alloc] init];
    for (NSString * elementHref in matchesHrefString ) {
        NSArray * result = [expressionRegularlink matchesInString:elementHref options:0 range:NSMakeRange(0, [elementHref length])];
        for (NSTextCheckingResult *match in result) {
            NSString* substringForMatch = [elementHref substringWithRange:match.range];
            [allLinks addObject:substringForMatch];
        }
    }
    return [NSArray arrayWithArray:allLinks];
}
#pragma mark - method to get the result
-(NSArray*)getMatches{
    return links;
}
@end
