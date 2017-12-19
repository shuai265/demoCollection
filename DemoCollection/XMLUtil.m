//
//  XMLUtil.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/16.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "XMLUtil.h"

@interface XMLUtil()<NSXMLParserDelegate>
@property NSMutableArray *a;
@end

@implementation XMLUtil

- (instancetype)init {
    self = [super init];
    if (self) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"PersonXML" ofType:@"xml"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        self.parser = [[NSXMLParser alloc] initWithData:data];
        
        self.parser.delegate = self;
        
        self.allPerson = [NSMutableArray array];
    }
    return self;
}

#pragma mark - NSXMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidStartDocument");
}

//准备节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    DLog(@"准备节点");
    DLog(@"parser = %@, elementName = %@, namespaceURI = %@, qulifiedName = %@, attribute=%@",parser,elementName,namespaceURI,qName,attributeDict);
    self.currentElement = elementName;
    if ([self.currentElement isEqualToString:@"student"]) {
        self.person = [[PersonObj alloc] init];
        [self.allPerson addObject:self.person];
    }
}

//获取节点内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    DLog(@"获取节点内容");
    DLog(@"parser = %@, foundCharacters = %@",parser,string);
    if ([self.currentElement isEqualToString:@"pid"]) {
        self.person.pid = string;
    } else if ([self.currentElement isEqualToString:@"name"]) {
        self.person.name = string;
    } else if ([self.currentElement isEqualToString:@"sex"]) {
        self.person.sex = string;
    } else if ([self.currentElement isEqualToString:@"age"]) {
        self.person.age = string;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    DLog(@"结束解析");
    DLog(@"parserDidEndDocument");
}

- (void)parse {
    [self.parser parse];
    DLog(@"%@",self.allPerson);
}


@end
