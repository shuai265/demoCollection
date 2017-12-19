//
//  CDUser+CoreDataProperties.m
//  
//
//  Created by liushuai on 2017/12/19.
//
//

#import "CDUser+CoreDataProperties.h"

@implementation CDUser (CoreDataProperties)

+ (NSFetchRequest<CDUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CDUser"];
}

@dynamic city;
@dynamic mbtype;
@dynamic name;
@dynamic screenName;
@dynamic profileImageUrl;
@dynamic status;

@end
