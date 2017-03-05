//
//  ObjectClass.m
//  12_lecture_Blocks
//
//  Created by Slava on 05.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "ObjectClass.h"

@interface ObjectClass ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end


@implementation ObjectClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak ObjectClass *weekSelf = self;
        self.objectBlock = ^ {
            NSLog(@"self name - %@", weekSelf.name);
        };
    }
    return self;
}

- (void) objectMetod: (ObjectBlock) block {
    block();
}


- (void) dealloc {
    NSLog(@"ObjectClass is deallocated");
}

@end
