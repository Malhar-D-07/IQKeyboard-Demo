//
//  SecondKeyboardViewController.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 06/06/22.
//

import UIKit
import IQKeyboardManagerSwift

class SecondKeyboardViewController: UIViewController {

    @IBOutlet weak var textField1: AppTextField!
    @IBOutlet weak var textField2: AppTextField!
    @IBOutlet weak var textField3: AppTextField!
    @IBOutlet weak var textField4: AppTextField!
    @IBOutlet weak var textField5: AppTextField!
    @IBOutlet weak var textField6: AppTextField!
    @IBOutlet weak var textField7: AppTextField!
    @IBOutlet weak var textField8: AppTextField!
    @IBOutlet weak var textField9 : AppTextField!
    @IBOutlet weak var textField10 : AppTextField!
    @IBOutlet weak var textField11 : AppTextField!
    @IBOutlet weak var textField12 : AppTextField!

    var textFields = [UITextField]()
    let textFieldsManager = TextFieldsManager()
    var returnKeyHandler:IQKeyboardReturnKeyHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [textField1, textField2, textField3, textField4, textField5, textField6, textField7, textField8, textField9, textField10, textField11, textField12]
        textFieldsManager.setAllDelegates(for: textFields, to: self)
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        returnKeyHandler?.lastTextFieldReturnKeyType = .done
    }
    
}

extension SecondKeyboardViewController: UITextFieldDelegate {
    
    private func textFieldDidBeginEditing(_ textField: AppTextField) {
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Returning textfield")
        return true
    }
}
