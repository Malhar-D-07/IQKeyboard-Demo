//
//  UITextField.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 06/06/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

extension UITextField {
    
    convenience init(hasNumberPad: Bool) {
        self.init()
        if (hasNumberPad) {
            self.keyboardType = .numberPad
            self.setKeyboardForKeypad1()
        }
    }
    
    func setKeyboardForKeypad1() {
        if isNumberPad1(self) {
            IQKeyboardManager.shared.enableAutoToolbar = true
            self.addRightButtonOnKeyboardWithText("Next", target: self, action: #selector(self.addRightButton1))
        } else {
            IQKeyboardManager.shared.enableAutoToolbar = false
            //            textField.inputAccessoryView = UIView()   // Used for removing the toolbar from textfields.
        }
    }

    func isNumberPad1(_ textField: UITextField) -> Bool {
         if textField.keyboardType == .numberPad || textField.keyboardType == .phonePad || textField.keyboardType == .decimalPad {
            return true
        } else {
            return false
        }
    }

    @objc func addRightButton1(_ sender: UITextField!) {
        if IQKeyboardManager.shared.canGoNext {
            IQKeyboardManager.shared.goNext()
        }
    }
}

