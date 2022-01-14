//
//  IconImage.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 14/01/22.
//

import UIKit

@IBDesignable
class IconImage: UIButton {

    @IBInspectable var iconSize: CGFloat = 30.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let config = UIImage.SymbolConfiguration(pointSize: iconSize)
        setPreferredSymbolConfiguration(config, forImageIn: .normal)
    }

}
