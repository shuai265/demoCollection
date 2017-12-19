//
//  CDStatus+CoreDataProperties.m
//  
//
//  Created by liushuai on 2017/12/19.
//
//

#import "CDStatus+CoreDataProperties.h"

@implementation CDStatus (CoreDataProperties)

+ (NSFetchRequest<CDStatus *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CDStatus"];
}

@dynamic createAt;
@dynamic source;
@dynamic text;
@dynamic user;

@end
