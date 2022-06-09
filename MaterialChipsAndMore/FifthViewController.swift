//
//  FifthViewController.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 08/06/22.
//

import UIKit
import IQKeyboardManagerSwift

class FifthViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField7: UITextField!
    @IBOutlet weak var textField8: UITextField!
    @IBOutlet weak var textField9: UITextField!
    @IBOutlet weak var textField10: UITextField!
    @IBOutlet weak var textField11: UITextField!
    @IBOutlet weak var textField12: UITextField!
    
    var textFields = [UITextField]()
    let textFieldsManager = TextFieldsManager()
    var returnKeyHandler:IQKeyboardReturnKeyHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [textField1, textField2, textField3, textField4, textField5, textField6, textField7, textField8, textField9, textField10, textField11, textField12]
        textFieldsManager.setAllDelegates(for: textFields, to: self)
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        returnKeyHandler?.lastTextFieldReturnKeyType = .done
        textField12.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(self.doneAction(_:)))
    }
    
    func setupReturnForLastTextField() {
        
    }
    
}

extension FifthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Returning textfield")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isNumberPad(textField) {
            if IQKeyboardManager.shared.canGoNext {
                IQKeyboardManager.shared.enableAutoToolbar = true
                textField.addRightButtonOnKeyboardWithText("Next", target: self, action: #selector(self.addRightButton))
            }
        }
        else{
            IQKeyboardManager.shared.enableAutoToolbar = false
        }
    }
    
    func isNumberPad(_ textField: UITextField) -> Bool {
        if textField.keyboardType == .numberPad || textField.keyboardType == .phonePad || textField.keyboardType == .decimalPad {
            return true
        } else {
            return false
        }
    }
    
    @objc func addRightButton(_ sender: IQBarButtonItem) {
        IQKeyboardManager.shared.goNext()
    }
    
    @objc func doneAction(_ sender: IQBarButtonItem) {
        print("Done Action")
    }
}
