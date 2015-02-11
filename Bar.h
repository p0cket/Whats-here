//
//  Bar.h
//  whatshere
//
//  Created by Yehuda Silbermintz on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#ifndef whatshere_Bar_h
#define whatshere_Bar_h

@interface Bar : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* fullAddress;
@property(strong, nonatomic) NSNumber* phoneNumber;

-(id)initWithName:(NSString*) name andFullAddress:(NSString*) fullAddress andPhoneNumber:(NSNumber*) phoneNumber;

@end


#endif
