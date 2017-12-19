//
//  XMLUtil.h
//  DemoCollection
//
//  Created by liushuai on 2017/12/16.
//  Copyright © 2017年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonObj.h"

@interface XMLUtil : NSObject

@property (nonatomic,strong) NSXMLParser *parser;
@property (nonatomic,strong) PersonObj *person;
@property (nonatomic,strong) NSMutableArray *allPerson;
@property (nonatomic,copy) NSString *currentElement;

- (void) parse;

@end
