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
    void p(){
        printf("\n");
        printf("%p: A::p() this\n ", this);
        printf("%p: A::p() p\n ", &A::p);
        printf("\n");
    }
    
    void test() {
        num = 10;
    }
};

int main(int argc, const char * argv[]) {
    A *a = new A();
    a->p();

    dispatch_block_t block = ^{
        printf("\n");
        printf("block begins\n");
        a->p();
        printf("block end\n");
        printf("\n");
    };

    dispatch_async(dispatch_get_main_queue(), block);
    dispatch_async(dispatch_get_main_queue(), block);

    [[NSRunLoop currentRunLoop] run];
    
    return 0;
}
