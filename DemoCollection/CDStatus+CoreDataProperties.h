//
//  CDStatus+CoreDataProperties.h
//  
//
//  Created by liushuai on 2017/12/19.
//
//

#import "CDStatus+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CDStatus (CoreDataProperties)

+ (NSFetchRequest<CDStatus *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *createAt;
@property (nullable, nonatomic, copy) NSString *source;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) CDUser *user;

@end

NS_ASSUME_NONNULL_END
