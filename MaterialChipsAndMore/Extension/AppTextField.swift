//
//  AppTextField.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 07/06/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class AppTextField: UITextField {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setKeyboardForKeypad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setKeyboardForKeypad()
    }
    
    func setKeyboardForKeypad() {
        if isNumberPad(self) {
            if IQKeyboardManager.shared.canGoNext {
                self.addRightButtonOnKeyboardWithText("Next", target: self, action: #selector(self.addRightButton))
            } else {
                self.addRightButtonOnKeyboardWithText("Done", target: self, action: #selector(self.addRightButton))
            }
            
        } else {
            IQKeyboardManager.shared.enableAutoToolbar = false
        }
    }
    
     func isNumberPad(_ textField: AppTextField) -> Bool {
        if textField.keyboardType == .numberPad || textField.keyboardType == .phonePad || textField.keyboardType == .decimalPad {
            return true
        } else {
            return false
        }
    }
    
    @objc func addRightButton(_ sender: IQBarButtonItem) {
        if IQKeyboardManager.shared.canGoNext {
            IQKeyboardManager.shared.goNext()
        } else {
            self.resignFirstResponder()
        }
    }
    
}
