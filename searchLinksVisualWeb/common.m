//
//  common.m
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 06/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import "common.h"

@implementation common
static NSString * _expressionRegularAherf = @"<a.+?href=\"([^\"]+)";
static NSString * _expresionRegularLinkHttp =@"((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+";
static NSString * _urlWebsite = @"http://www.visual-engin.com/Web";
static NSString * _IdentifierCellLink = @"cell";

+(NSString*) getExpressionRegularAherf {
    return _expressionRegularAherf;
}
+(NSString*) getExpresionRegularLinkHttp {
    return _expresionRegularLinkHttp;
}
+(NSString*) getUrlWebsite {
    return _urlWebsite;
}
+(NSString*) getIdentifierCellLink {
    return _IdentifierCellLink;
}
@end
