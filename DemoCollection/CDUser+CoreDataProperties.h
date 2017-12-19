//
//  CDUser+CoreDataProperties.h
//  
//
//  Created by liushuai on 2017/12/19.
//
//

#import "CDUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CDUser (CoreDataProperties)

+ (NSFetchRequest<CDUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *mbtype;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *screenName;
@property (nullable, nonatomic, copy) NSString *profileImageUrl;
@property (nullable, nonatomic, retain) CDStatus *status;

@end

NS_ASSUME_NONNULL_END
