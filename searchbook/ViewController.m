//
//  ViewController.m
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"
#import <Security/Security.h>
#import "BookModel.h"
#import "BookCell.h"
#import "BookDetail.h"
//#import <runetype.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "searchbook-Swift.h"
#import "OCViewController.h"


@interface ViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) BookModel * bookModel;
@property (strong, nonatomic) NSMutableArray * bookArr;
@property (strong, nonatomic) NSString * urlTrail;
@end

@implementation ViewController
{
  
}
- (IBAction)push:(id)sender {
//    SwiftViewController * ss = [[SwiftViewController alloc] initWithNibName:@"SwiftViewController" bundle:nil];
//    SwiftViewController * swift = [[SwiftViewController alloc] init];
//    swift.view.frame = CGRectMake(0, 0, 320, 540);
//    swift.view.backgroundColor = [UIColor redColor];
//    swift.kk = @"asdf";
//    [self.navigationController pushViewController:swift animated:YES];
    
    OCViewController * oc = [[OCViewController alloc] initWithNibName:@"OCViewController" bundle:nil];
    [self.navigationController pushViewController:oc animated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.urlTrail = searchText;
    [self updateData];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BookCell * cell = sender;
    BookDetail *controller = segue.destinationViewController;
    controller.bookContent = [[UITextView alloc] init];
    NSString * content = [cell getBookDeatil].summary;
    [controller setValue:content forKeyPath:@"content"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.bookArr = [[NSMutableArray alloc] init];
    if (self.bookModel==nil) {
         self.bookModel = [[BookModel alloc] init];
    }
    [self updateData];
}
- (void)handlerJSONData:(NSData *)data
{
    //json文件中的[]表示一个数据。
    //反序列化json数据
    /*
     序列化： 将一个nsboject转换成序列数据，以便通过互联网进行传输。
     反序列化：将网络上获取的数据反向生成我们需要的对象。
     */
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
    }];
    [self.bookModel setValuesForKeysWithDictionary:dic];
    [self.mainTableView reloadData];
    NSLog(@"%@", self.bookModel);  //json解析以后是nsarray格式的数据。
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([BookModel class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSString *propertyType = [[NSString alloc] initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        if ([[dic allKeys] containsObject:propertyName]) {
            id value = [dic valueForKey:propertyName];
            if (![value isKindOfClass:[NSNull class]] && value != nil) {
                if ([value isKindOfClass:[NSDictionary class]]) {
//                    id pro = [self createInstanceByClassName:[self getClassName:propertyType]];
//                    [pro reflectDataFromOtherObject:value];
                    
//                    [self setValue:pro forKey:propertyName];
                }else{
//                    [self setValue:value forKey:propertyName];
                    
                }
            }
            
        }
        
    }
    free(properties);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell loadBookData:self.bookModel];
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BookCell * cell = (BookCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"BookDetail" sender:cell];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachesDirectory = [paths objectAtIndex:0];
    NSString * archivePath = [cachesDirectory stringByAppendingString:@"AppCache/MenuItems.archive"];
    NSMutableArray * model = [[NSMutableArray alloc] init];
    model = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    NSLog(@"%@",model);
}
-(void)viewDidDisappear:(BOOL)animated{
    [self.bookArr addObject:self.bookModel];
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachesDirectory = [paths objectAtIndex:0];
    NSString * archivePath = [cachesDirectory stringByAppendingString:@"AppCache/MenuItems.archive"];
    [NSKeyedArchiver archiveRootObject:self.bookArr toFile:archivePath];
}
-(void)updateData{
    
    // 创建Data Task，用于打开我的csdn blog主页
//    NSURL *url = [NSURL URLWithString:@"https://posreg.nexttao.com/nt_pos_registration/get_config.api?code=415015"];//注意，必须是https协议
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                                completionHandler:
//                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
//                                          NSLog(@"sadf%@",data);
//                                            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//                                           NSLog(@"sadf%@",dic);
//                                          // 输出返回的状态码，请求成功的话为200
////                                          [self showResponseCode:response];
//                                          
//////                                           在webView中加载数据
////                                          [self.webView loadData:data
////                                                        MIMEType:@"text/html"
////                                                textEncodingName:@"utf-8"
////                                                         baseURL:nil];
//                                          
//                                          // 加载数据完毕，停止spinner
////                                          [self.spinner stopAnimating];
//                                      }];
//    // 使用resume方法启动任务
//    [dataTask resume];
    
    
    NSLog(@"load json");
    //从web服务器加载数据
//    NSString *str = [NSString stringWithFormat:@"https://api.douban.com/v2/book/%@",self.urlTrail ];//1220562;
//     NSString *str = [NSString stringWithFormat:@"https://api.douban.com/v2/book/1220562"];//1220562;https://api.douban.com/v2/book/1220562"//@"https://posreg.nexttao.com/nt_pos_registration/get_config.api?code=415015"
    NSString *str = [NSString stringWithFormat:@"http://192.168.1.4/1220562.json"];
    //这里是乱写的
    //提示：NSData本身具有同步方法，但是在实际开发中，不要使用次方法
    //在使用NSData的同步方法时，无法指定超时时间，如果服务器连接不正常，会影响用户体验。
    //NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
    //简历NSURL
    NSURL *url = [NSURL URLWithString:str];
    //建立NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0f];
    //建立NSURLConnect的同步方法加载数据
    NSURLResponse *response = nil;
    NSError *error = nil;
    //同步加载数据
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //错误处理
    if (data != nil) {
        //下面这两句话本身没有什么意义，仅用于跟踪调试。
        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", result);
        
        //在处理网络数据的时候，不要将NSData转换成nsstring。
        [self handlerJSONData:data];
    }else if (data == nil && error == nil){
        NSLog(@"空数据");
    }else
    {
        NSLog(@"%@", error.localizedDescription);
    }
}
@end
