//
//  searchButton.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/10/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import UIKit

class searchButton: UIButton {

    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        layer.cornerRadius = frame.width / 2
        layer.shadowOpacity = 1.0
        layer.shadowColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
    }
}
