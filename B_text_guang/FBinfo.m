//
//  FBinfo.m
//  B_text_guang
//
//  Created by Aditya Narayan on 5/21/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import "FBinfo.h"

@implementation FBinfo

-(NSMutableDictionary *)add: (NSString *)email name:(NSString *)name{
    NSMutableDictionary * add = [[NSMutableDictionary alloc]init];
    [add setObject:email forKey:name];
    return add;
}

@end
