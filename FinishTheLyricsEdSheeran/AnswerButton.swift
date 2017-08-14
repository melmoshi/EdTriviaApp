//
//  RoundedCornerButton.swift
//  DinnerApp
//
//  Created by Mel and Sand on 2017-05-10.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = UIColor(red: 253/255, green: 113/255, blue: 51/255, alpha: 0)
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor(red: 1/255, green: 149/255, blue: 227/255, alpha: 1)
            } else {
                backgroundColor = UIColor(red: 1/255, green: 149/255, blue: 227/255, alpha: 0)
            }
        }
    }
    


}
