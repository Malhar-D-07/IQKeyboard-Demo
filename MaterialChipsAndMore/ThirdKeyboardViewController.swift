//
//  ThirdKeyboardViewController.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 06/06/22.
//

import UIKit
import IQKeyboardManagerSwift

class ThirdKeyboardViewController: UIViewController {

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
    var returnKeyHandler:IQKeyboardReturnKeyHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [textField1, textField2, textField3, textField4, textField5, textField6, textField7, textField8, textField9, textField10, textField11, textField12]
        textFieldsManager.setAllDelegates(for: textFields, to: self)
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
    }
}

extension ThirdKeyboardViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setKeyboardForKeypad1()
    }
}
