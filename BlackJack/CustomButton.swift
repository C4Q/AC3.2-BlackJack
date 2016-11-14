//
//  customButton.swift
//  BlackJack
//
//  Created by Marty Avedon on 11/13/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = UIColor( red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0 ).cgColor
    self.layer.borderWidth = 1.75
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
