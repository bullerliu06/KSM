//
//  PPAuthCodeView.m
// FIexiLend
//
//  Created by jacky on 2024/11/12.
//

#import "PPAuthCodeView.h"

#define AuthCodeFont 24
#define AuthCodeLength 6

@implementation PPAuthCodeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        [self reloadUI];
    }
    return self;
}

- (void)reloadUI {
    [self addSubview:self.textView];
    for (int i = 0; i < AuthCodeLength; i++) {
        CGFloat lineWidth = (self.w - 5*10)/6;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i*(lineWidth + 10), self.h - 1, lineWidth, 1)];
        line.backgroundColor = UIColor.blackColor;
        [self addSubview:line];
    }
}


- (NSString *)text {
    return self.textView.text;
}

- (void)toResponder {
    [_textView becomeFirstResponder];
}

- (void)setText:(NSString *)text {
    self.textView.text = text;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (![self isNumber:string]) {
        return NO;
    }
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (newString.length > 6) {
        return NO;
    }
    return YES;
}

- (UITextField *)textView {
    if (!_textView) {
        CGFloat textWidth = self.w - 2*LeftMargin;
        _textView = [[UITextField alloc] initWithFrame:CGRectMake(LeftMargin, 0, textWidth + 100, self.h)];
        _textView.textColor = TextBlackColor;
        _textView.clearButtonMode = UITextFieldViewModeNever;
        _textView.keyboardType = UIKeyboardTypeNumberPad;
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textView.delegate = self;
        _textView.borderStyle = UITextBorderStyleNone;
        [_textView addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        CGFloat space = (textWidth - 6*14)/(AuthCodeLength - 1);
        _attrsDic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:AuthCodeFont], NSKernAttributeName:[NSNumber numberWithFloat:space]};
    }
    return _textView;
}

- (void)textFieldDidChange:(UITextField *)textField {
    textField.attributedText = [[NSAttributedString alloc] initWithString:textField.text attributes:_attrsDic];
    if (self.changeBlock) {
        self.changeBlock();
    }
}




- (BOOL)isNumber:(NSString *)string {
    unichar c;
    for (int i = 0; i < string.length; i++) {
        c = [string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}
@end
