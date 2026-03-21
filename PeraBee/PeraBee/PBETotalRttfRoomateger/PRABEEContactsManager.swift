//
//  PRABEEContactsManager.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit
import ContactsUI

class PRABEEContactsManager: NSObject,CNContactPickerDelegate {
    
    typealias vlodes = (String?, String?) -> Void
    private var coneNewcodelr: vlodes?
    
    static let ctsManAbc = PRABEEContactsManager()
    
    func slingDerCalloetr(bueiat viewController: UIViewController, roomw: @escaping vlodes) {
        self.coneNewcodelr = roomw
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        viewController.present(contactPicker, animated: true, completion: nil)
    }
    
    // MARK: - CNContactPickerDelegate
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        coneNewcodelr?(nil, nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let bdeiihe1 = CNContactFormatter.string(from: contact, style: .fullName)
        let bdeiihe2 = contact.phoneNumbers.first?.value.stringValue
        coneNewcodelr?(bdeiihe1, bdeiihe2)
    }
    
    
}
