//
//  BFLogger.m
//  BFLogger_Tests
//
//  Created by Francesco Novelli on 09/01/18.
//  Copyright © 2018 F9. All rights reserved.
//

#import "BFLogger.h"

#import <AFNetworking/AFNetworking.h>

@interface BFLogger () {
    
}
@property (nonatomic, retain) AFHTTPSessionManager *manager;

@end

@implementation BFLogger

+ (id)sharedManager {
    static BFLogger *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        
        NSString *baseURL = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BFLogger_base_url"];
        sharedMyManager.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        sharedMyManager.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [sharedMyManager.manager.requestSerializer setValue:@"testLog" forHTTPHeaderField:@"client-key"];
        
        
    });
    return sharedMyManager;
}
- (void)postLog:(NSString *)log {
    
#ifdef DEBUG
    
    printf("%s\n", [log UTF8String]);
#endif
    
    [self.manager POST:@"add"
            parameters:@{
                         @"status" : @"OK",
                         @"timestamp" : @([[NSDate date] timeIntervalSinceReferenceDate]),
                         @"token" : [BFLogger deviceID],
                         @"msg" : log,
                         }
              progress:^(NSProgress * _Nonnull uploadProgress) {
                  
              }
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   printf("%s\n", [[NSString stringWithFormat:@"LOG: RES: %@", responseObject] UTF8String] );
               }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   printf("%s\n", [[NSString stringWithFormat:@"LOG: ERR: %@", error] UTF8String] );
               }];
    
}

+ (NSString *)deviceID {
    NSString *identifier = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return identifier.lowercaseString;
}


@end
