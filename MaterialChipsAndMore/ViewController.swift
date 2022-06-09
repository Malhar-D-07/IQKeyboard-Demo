//
//  ViewController.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 26/04/22.
//

import UIKit
import MaterialComponents.MaterialChips

class ViewController: UIViewController, MDCChipFieldDelegate {

    @IBOutlet weak var chipView: MDCChipView!
    @IBOutlet weak var chipLabel: CustomChipView!
    @IBOutlet weak var chipButton: CustomChipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnotherChip(x:0,y:0)
//        addAnotherChip(x: 30, y: 30)
        chipButton.titleLabel.text = "AETNA"
        chipLabel.titleLabel.text = "AETNA"
        chipView.titleLabel.text = "Malhar"
        chipView.backgroundColor = .green
//        addChipField()
        
    }
    
    func addAnotherChip(x:Int, y: Int) {
        let chipView = CustomChipView(frame: CGRect(x: x, y: y, width: 50, height: 50))
        chipView.titleLabel.text = "Tap me Hello Hello Hello Hello Hello Hello Hello"
        chipView.setTitleColor(UIColor.red, for: .selected)
        chipView.sizeToFit()
        self.view.addSubview(chipView)
        chipView.translatesAutoresizingMaskIntoConstraints = true
        chipView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        chipView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    }
    
//    func addChipField() {
//        let chipField = MDCChipField(frame: CGRect(x: 20, y: 20, width: 150, height: 100))
//        chipField.delegate = self
//        chipField.textField.placeholderLabel.text = "This is a chip field."
//        chipField.showChipsDeleteButton = true
//        chipField.backgroundColor = .green
//        chipField.sizeToFit()
//        view.addSubview(chipField)
//        chipField.translatesAutoresizingMaskIntoConstraints = true
//        chipField.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        chipField.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
//    }
    
}

