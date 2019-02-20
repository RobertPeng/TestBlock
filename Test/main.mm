//
//  main.m
//  Test
//
//  Created by zhangpeng on 2/20/19.
//  Copyright © 2019 John. All rights reserved.
//

#import <Foundation/Foundation.h>

struct A
{
public:
    int num = 5;
    A() {
        printf("%p: A::A()\n", this);
    }
    A(A const &that) {
        printf("%p: A::A(A const &%p)\n", this, &that);
    }
    ~A() {
        printf("%p: A::~A()\n", this);
    }
};

int main(int argc, const char * argv[]) {
    __block A a;
    a.num = 5;
    printf("====== 定义__block关键字后 ======\n");
    printf("a addr: %p\n", &a);
    printf("a.num: %d\n", a.num);
    printf("a.num addr: %p\n\n", &(a.num));
    
    void (^TestBlock)(void) = ^{
        printf("====== 在block中 ======\n");
        printf("a addr: %p\n", &a);
        printf("a.num: %d\n", a.num);
        printf("a.num addr: %p\n\n", &(a.num));
    };
    
    printf("====== 在block后 ======\n");
    printf("a addr: %p\n", &a);
    printf("a.num: %d\n", a.num);
    printf("a.num addr: %p\n\n", &(a.num));
    a.num = 15;
    TestBlock();
    
    return 0;
}
