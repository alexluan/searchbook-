//
//  BookModel.h
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import <Foundation/Foundation.h>
//"id":"1220562",
//"alt":"http:\/\/book.douban.com\/book\/1220562",
//"rating":{"max":10, "average":"7.0", "numRaters":282, "min":0},
//"author":[{"name":"片山恭一"}, {"name":"豫人"}],
//"alt_title":"",
//"image":"http:\/\/img1.douban.com\/spic\/s1747553.jpg",
//"title":"满月之夜白鲸现",
//"mobile_link":"http:\/\/m.douban.com\/book\/subject\/1220562\/",
//"summary":"那一年，是听莫扎特、钓鲈鱼和家庭破裂的一年。说到家庭破裂，母亲怪自己当初没有找到好男人，父亲则认为当时是被狐狸精迷住了眼，失常的是母亲，但出问题的是父亲……。",
//"attrs":{
//    "publisher":["青岛出版社"],
//    "pubdate":["2005-01-01"],
//    "author":["片山恭一", "豫人"],
//    "price":["18.00元"],
//    "title":["满月之夜白鲸现"],
//    "binding":["平装(无盘)"],
//    "translator":["豫人"],
//    "pages":["180"]
//},
@interface BookModel : NSObject<NSCoding, NSCopying>

@property(nonatomic, copy)NSString * bookId;
@property(nonatomic, copy)NSString * alt;
@property(nonatomic, copy)NSMutableDictionary * rating;
@property(nonatomic, copy)NSMutableArray * author;
@property(nonatomic, copy)NSString * alt_title;
@property(nonatomic, copy)NSString * image;
@property(nonatomic, copy)NSString * title;
@property(nonatomic, copy)NSString * summary;
@property(nonatomic, copy)NSMutableDictionary * attrs;
@end

@interface Author : NSMutableDictionary<NSCoding, NSCopying, NSMutableCopying>
@property(nonatomic, copy)NSString * name;
@end

@interface Rating : NSMutableDictionary<NSCoding, NSCopying, NSMutableCopying>
@property(nonatomic, copy)NSString * max;
@property(nonatomic, copy)NSString * average;
@property(nonatomic, copy)NSString * numRaters;
@property(nonatomic, copy)NSString * min;
@end

@interface Attrs : NSMutableDictionary<NSCoding, NSCopying, NSMutableCopying>
@property(nonatomic, copy)NSString * publisher;
@property(nonatomic, copy)NSString * pubdate;
@property(nonatomic, copy)NSString * author;
@property(nonatomic, copy)NSString * price;
@property(nonatomic, copy)NSString * title;
@property(nonatomic, copy)NSString * binding;
@property(nonatomic, copy)NSString * translator;
@property(nonatomic, copy)NSString * pages;
@end