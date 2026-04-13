//
//  PPLinkMan.m
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import "PPLinkMan.h"

#import <ContactsUI/ContactsUI.h>

@interface PPLinkMan() <CNContactPickerDelegate>
@end

@implementation PPLinkMan

- (void)show {
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];
    contactPicker.delegate = self;
    contactPicker.modalPresentationStyle = UIModalPresentationFullScreen;
    contactPicker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    [Page present:contactPicker animated:YES completion:nil];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    
    NSString *name = [NSString stringWithFormat:@"%@%@",contactProperty.contact.familyName,contactProperty.contact.givenName];
    NSString *phone = [contactProperty.value stringValue];
    
    if (self.selectBlock) {
        self.selectBlock(@{@"phone":notNull(phone),@"name":notNull(name)});
    }
}

@end
