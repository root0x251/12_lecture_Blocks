//
//  AppDelegate.m
//  12_lecture_Blocks
//
//  Created by Slava on 05.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "ObjectClass.h"

typedef NSString *(^TypedefBlock) (NSInteger);
typedef void(^VoidTypdef)(void);


@interface AppDelegate ()

@property (copy, nonatomic) VoidTypdef testBlock;     // блоки всегда должны быть COPY
@property (strong, nonatomic) NSString *name;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    void(^testBlock)(void); // определяем блок (testBlock), который ничего не принимает и не возвращает
//    testBlock = ^ {         //
//        NSLog(@"test Block");
//    };
//    testBlock();
    
    
    // cоздаем блок (testBlock), который ничего не принимает и не возвращает
    void (^testBlock)(void) = ^{
        NSLog(@"test Block");
    };
    testBlock();

    
    // создаем переменную testBlockWithParametrs, которая принимает значения NSString *, NSInteger, но ничего не возвращает
    // ^(NSString *string, NSInteger intValue) это принимаемые параметры блока
    void (^testBlockWithParametrs)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        NSLog(@"test Block With Par = string - %@, int Value - %d", string, intValue);
    };
    testBlockWithParametrs(@"im Sting", 228);
    
    
    // блок который принимает параметры и возвращает
    NSString *(^testBlockWithReturnParamsAndValue)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        return [NSString stringWithFormat:@"test Block With Return Params And Value = %@, %d", string, intValue];
    };
    NSString *result = testBlockWithReturnParamsAndValue(@"im a String", 228);
    NSLog(@"%@", result);
    
    
    // отличие метода от блока
    // в методе вызвать testString невозможно (без @property
    NSString *testString = @"is it possible?!";
    __block NSInteger value = 0;    // __block означает, что переменная изменяется внутри блока
    
    __block NSString *changedString;
    __block NSInteger changedValue = 0;
    void (^testBlockTwo)(void) = ^ {
        NSLog(@"test block two");
        NSLog(@"%@", testString);   // уникальная возможность блоков
        NSLog(@"the number of calls = %d", ++value); // количество вызовов (!!!изменяемый параметр)
        
        
        // изменяем строку
        changedString = [NSString stringWithFormat:@"changed string %d", ++changedValue];
        NSLog(@"%@", changedString);
        
    };
    testBlockTwo();
    testBlockTwo();

    
    // метод который принимает блок как параметр
    [self testBlockMethod:^{
        NSLog(@"im a block, number of my string = 74");
    }];

    
    
    
    
    
    // переопределение
    TypedefBlock tb = ^ (NSInteger integerValue) {
        return [NSString stringWithFormat:@"Typedef  %d", integerValue];
    };
    NSLog(@"%@", tb(5));

    
    
    
    // объект не уничтожается
    ObjectClass *obj = [ObjectClass new];
    obj.name = @"Object";
    __weak ObjectClass *weekObj = obj;
    self.testBlock = ^ {
//        NSLog(@"%@", obj.name);   // strong
        NSLog(@"%@", weekObj.name); // weak 
    };
    self.testBlock();
    
    self.name = @"Hello!";
    ObjectClass *obj2 = [ObjectClass new];
    obj2.name = @"Object2";
    [obj2 objectMetod:^{
        NSLog(@"%@", self.name);
    }];
    
    return YES;
}
// метод который принимает блок как параметр
- (void) testBlockMethod:(void(^)(void)) block  {
    NSLog(@"im a method, number of my string = 85");
    // блок который передан в метод
    block();
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
