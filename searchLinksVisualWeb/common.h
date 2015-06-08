//
//  common.h
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 06/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface common : NSObject

/**
 This method get string with the expression regular for identificate <a href=... ></a>
 @return <a.+?href=\"([^\"]+)
 */
+(NSString*) getExpressionRegularAherf;
/**
 This method get string with the expression regular for identificate url.
 @return http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?
 */
+(NSString*) getExpresionRegularLinkHttp;
/**
 This method get string with the url.
 @return http://www.visual-engin.com/Web
 */
+(NSString*) getUrlWebsite;
/**
  this method get identifier for a cell
 @return @"cell"
 */
+(NSString*) getIdentifierCellLink;
@end
