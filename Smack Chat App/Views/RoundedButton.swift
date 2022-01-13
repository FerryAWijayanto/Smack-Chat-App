//
//  RoundedButton.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 13/01/22.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
//        setupView()
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
