//
//  RoundButton.swift
//  CalcIOS
//
//  Created by Michael Perrone on 3/23/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2;
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2;
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
