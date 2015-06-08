//
//  SearcherLinksWeb.h
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 04/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearcherLinksWeb : NSObject
/**
 This function is for init the SearcherLinksWeb Object and use for call methods.
 Example:
    NSArray *link= [[SearcherLinksWeb sharedInstance] getMatches];
 */
+(SearcherLinksWeb*)sharedInstance;

 /**
  This method get all links
  @return A array of strings every element is a link. If is empty there are not links or problems with conexion
 */
-(NSArray*)getMatches;
/**
 This method download data of Website.
 @param urlWebsite is the website to study
 @return String have all website.
 */
-(NSString*)downloadWeb:(NSString*)urlWebsite;
/**
 Save all matchs find in the string with the expressionHref.
 @param string have all information where there are look for matchs
 @param RegularExpressionHref is the regular expression necessary.
 @return Array with all matches in DataString.
 */
-(NSArray*)searchMatchString:(NSString*)string RegularExpressionHref:(NSRegularExpression*)regularExpressionHref;
/**
 This method look for all match and put information in one array to NSStrings.
 @param matchesAhref is Array have all information about ahrefs found it.
 @param urlDataString is original string of the website.
 @return Array of strings with matchs ahref.
 */
-(NSArray*)getArrayMatchs:(NSArray*)matchesAhref StringUrlData:(NSString*)urlDataString;
/**
 This method look for all links into each strings of the array.
 @param matchesHrefString is a array where there are look for links in each element.
 @param RegularExpressionLink is the regular expression to find url.
 @return array with all links into array matchesHrefString.
 */
-(NSArray*)getMatchesLink:(NSArray*)matchesHrefString RegularExpresionLink:(NSRegularExpression*)expressionRegularlink;

@end
