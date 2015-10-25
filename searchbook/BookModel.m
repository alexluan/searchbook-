//
//  BookModel.m
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel
- (id)copyWithZone:(NSZone *)zone
{
    id theCopy = [[[self class] allocWithZone:zone] init];  // use designated initializer
    
//    [theCopy setItemId:[self.bookId copy]];
    [theCopy setBookId:[self.bookId copy]];
    return theCopy;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.bookId forKey:@"BookId"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super init])) {
        self.bookId = [aDecoder decodeObjectForKey:@"BookId"];
    }
    return self;
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.bookId = value;
    }
    
}
-(void)setValue:(id)value forKey:(NSString *)key{
    if ([[value description] isEqualToString:@""]) {
        return;
    }
    if ([key isEqualToString:@"attrs"]) {
        @try {
            for (NSMutableDictionary* attrsDic in value) {
                Attrs * attrs = [[Attrs alloc] initWithDictionary:attrsDic];
                self.attrs = attrs;
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
       
    }else if ([key isEqualToString:@"rating"]) {
        @try {
            for (NSMutableDictionary* attrsDic in value) {
                Rating * rating = [[Rating alloc] initWithDictionary:attrsDic];
                self.rating = rating;
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
       
    }else if ([key isEqualToString:@"author_intro"]) {
        @try {
            for (NSMutableDictionary* attrsDic in value) {
                Author * author = [[Author alloc] initWithDictionary:attrsDic];
                [self.author  addObject:author];
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }else{
        [super setValue:value forKey:key];
//        return;
    }

}
@end
@implementation Author

@end
@implementation Rating

@end
@implementation Attrs

@end
