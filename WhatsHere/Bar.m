//
//  Bar.m
//  whatshere
//
//  Created by Yehuda Silbermintz on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "Bar.h"
#import <Foundation/Foundation.h>


@interface Bar ()

@end

@implementation Bar


-(id)initWithName:(NSString*) name andFullAddress:(NSString*) fullAddress andPhoneNumber:(NSNumber*) phoneNumber{
    self = [super init];
    if(self){
        self.name = name;
        self.fullAddress = fullAddress;
        self.phoneNumber = phoneNumber;
    }
    return self;
}


@end