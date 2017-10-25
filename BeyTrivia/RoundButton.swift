//
//  RoundButton.swift
//  DinnerApp
//
//  Created by Mel and Sand on 2017-06-09.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 18
        clipsToBounds = true
    }
    
    
}

class RoundLabel: UILabel {
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
}

class CircularButton : UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 40
        clipsToBounds = true
    }
    
    
}
