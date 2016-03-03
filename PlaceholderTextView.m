//
//  PlaceholderTextView.m
//  ComicsIsland
//
//  Created by SHIJIAN on 16/3/3.
//  Copyright © 2016年 appfactory. All rights reserved.
//

#import "PlaceholderTextView.h"

#define kFPlaceholderX 5
#define kFPlaceholderY 7
#define kFPlaceholderHeight 20

@interface PlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation PlaceholderTextView

#pragma mark - delalloc

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - init method

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createPlaceholderLabel];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createPlaceholderLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self createPlaceholderLabel];
    }
    return self;
}

#pragma mark - setter method

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.placeholderLabel.frame = CGRectMake(kFPlaceholderX, kFPlaceholderY, frame.size.width, kFPlaceholderHeight);
}

- (void)setPlaceholder:(NSString *)placeholder {
    if ([_placeholder isEqualToString:placeholder]) {
        return;
    }
    
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    if ([_attributedPlaceholder isEqualToAttributedString:attributedPlaceholder]) {
        return;
    }
    
    _attributedPlaceholder = attributedPlaceholder;
    self.placeholderLabel.attributedText = attributedPlaceholder;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    if ([_placeholderFont isEqual:placeholderFont]) {
        return;
    }

    _placeholderFont = placeholderFont;
    self.placeholderLabel.font = placeholderFont;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    if ([_placeholderColor  isEqual:placeholderColor]) {
        return;
    }
    
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

#pragma mark - create placeholder label

- (void)createPlaceholderLabel {
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFPlaceholderX, kFPlaceholderY, self.width, kFPlaceholderHeight)];
    self.placeholderLabel.font = [UIFont systemFontOfSize:15];
    self.placeholderLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.placeholderLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textDidChange:(NSNotification *)notification {
    if (self.text.length) {
        self.placeholderLabel.hidden = YES;
    } else {
        self.placeholderLabel.hidden = NO;
    }
}

@end
