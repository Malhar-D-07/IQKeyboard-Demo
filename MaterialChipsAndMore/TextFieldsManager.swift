//
//  TextFieldsManager.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 16/05/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class TextFieldsManager {
    let textFieldCollection = [UITextField]()
    var tag = 0
    
    func setAllDelegates(for textFields: [UITextField], to view: UITextFieldDelegate) {
        textFields.forEach { textField in
            textField.delegate = view
        }
    }
    
    func setTags(for textFields: [UITextField]) {
        textFields.forEach { textField in
            textField.tag = self.tag
            tag += 1
        }
        
    }
    
    
}
