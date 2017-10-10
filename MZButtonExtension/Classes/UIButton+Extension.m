//
//  UIButton+Extension.m
//  ButtonCategory
//
//  Created by Lynn Zhang on 2017/10/9.
//  Copyright © 2017年 Lynn Zhang. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)layoutButtonImageStyle:(MZImageStyle)style imageTitleSpace:(CGFloat)space {
    
    // 1、获取button的Image宽高
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2、imageEdges和titleEdges
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3、根据style和space获取imageEdges和titleEdges
    /*
    MZImageStyleTop,    //image在上，title在下
    MZImageStyleLeft,   //image在左，title在右
    MZImageStyleRight,  //image在右，title在左
    MZImageStyleBottom  //image在下，title在上
    */
    
    switch (style) {
        case MZImageStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight - space/2.0, 0);
        }
            break;
            
        case MZImageStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
            
        case MZImageStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space/2.0, 0, -labelWidth - space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space/2.0, 0, imageWidth + space/2.0);
        }
            break;
            
        case MZImageStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space/2.0, -imageWidth, 0, 0);
        }
            break;
            
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
