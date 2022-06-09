//
//  KeyboardManager.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 16/05/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class KeyboardManagerViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField7: UITextField!
    @IBOutlet weak var textField8: UITextField!
    @IBOutlet weak var textField9 : UITextField!
    @IBOutlet weak var textField10 : UITextField!
    @IBOutlet weak var textField11 : UITextField!
    @IBOutlet weak var textField12 : UITextField!

    var textFields = [UITextField]()
    let textFieldsManager = TextFieldsManager()
    var currentNumberPadTextField: UITextField?
    public var overrideIteratingTextFields: [UIView]?
    var returnKeyHandler:IQKeyboardReturnKeyHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [textField1, textField2, textField3, textField4, textField5, textField6, textField7, textField8, textField9, textField10, textField11, textField12]
        textFieldsManager.setAllDelegates(for: textFields, to: self)
        textFieldsManager.setTags(for: textFields)
        textField5.keyboardType = .numberPad
        textField11.keyboardType = .numberPad
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
//        IQKeyboardManager.sharedManager().overrideIteratingTextFields = textFields
    }
    
    @discardableResult
    private func changeResponder(_ textField: UITextField) -> Bool {
        let nextTextFieldTag = textField.tag + 1
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
}

extension KeyboardManagerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.changeResponder(textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isNumberPad(textField) {
            currentNumberPadTextField = textField
            textField.addRightButtonOnKeyboardWithText("Next", target: nil, action: #selector(doneButtonAction))
        }
    }
    
    func isNumberPad(_ textField: UITextField) -> Bool {
        return textField.keyboardType == .numberPad ? true : false
    }
    
    @objc func doneButtonAction() {
        changeResponder(currentNumberPadTextField!)
    }
}
