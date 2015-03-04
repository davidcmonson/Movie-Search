//
//  NetworkController.h
//  Movie-Search
//
//  Created by Jason Noah Choi on 3/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;
+ (NSDictionary *)parametersWithAPIKey:(NSDictionary *)parameters;
+ (NSString *)apiKey;

@end
