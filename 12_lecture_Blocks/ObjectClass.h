//
//  ObjectClass.h
//  12_lecture_Blocks
//
//  Created by Slava on 05.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ObjectBlock)(void);

@interface ObjectClass : NSObject

@property (strong, nonatomic) NSString *name;

- (void) objectMetod: (ObjectBlock) block;
@end
