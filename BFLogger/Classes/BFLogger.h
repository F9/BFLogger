//
//  BFLogger.h
//  BFLogger_Tests
//
//  Created by Francesco Novelli on 09/01/18.
//  Copyright © 2018 F9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFLogger : NSObject

+ (id)sharedManager;
- (void)postLog:(NSString *)log;

@end
