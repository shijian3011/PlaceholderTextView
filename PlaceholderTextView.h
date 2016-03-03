//
//  PlaceholderTextView.h
//  ComicsIsland
//
//  Created by SHIJIAN on 16/3/3.
//  Copyright © 2016年 appfactory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView

@property(nonatomic, copy) NSString *placeholder;
@property(nonatomic, copy) NSAttributedString *attributedPlaceholder;

@property (nonatomic, strong) UIFont *placeholderFont;
@property (nonatomic, strong) UIColor *placeholderColor;

@end
