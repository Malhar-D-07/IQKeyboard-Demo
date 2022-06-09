//
//  ChipView.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 26/04/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialChips

public class CustomChipView:MaterialComponents.MDCChipView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        self.setBackgroundColor(UIColor(named: "Background"), for: .normal)
        self.contentPadding = UIEdgeInsets(top: 2, left: 12, bottom: 2, right: 12)
        self.setInkColor(UIColor.green, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.isUserInteractionEnabled = false
        self.titleLabel.font = UIFont(name: "Helvetica Nue", size: 16)
        self.frame.size.height = 24
        self.cornerRadius = 4
        self.titleLabel.text = "Hello"
    }
}
