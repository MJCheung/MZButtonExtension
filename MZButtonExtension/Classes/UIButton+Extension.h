//
//  UIButton+Extension.h
//  ButtonCategory
//
//  Created by Lynn Zhang on 2017/10/9.
//  Copyright © 2017年 Lynn Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MZImageStyle) {
    MZImageStyleTop,    //image在上，title在下
    MZImageStyleLeft,   //image在左，title在右
    MZImageStyleRight,  //image在右，title在左
    MZImageStyleBottom  //image在下，title在上
};

@interface UIButton (Extension)

- (void)layoutButtonImageStyle:(MZImageStyle)style imageTitleSpace:(CGFloat)space;

@end
