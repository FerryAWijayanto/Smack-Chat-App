//
//  AvatarCell.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 14/01/22.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(withIndex index: Int, type: AvatarType) {
        switch type {
        case .dark:
            avatarImage.image = UIImage(named: "dark\(index)")
            backgroundColor = .gray
        case .light:
            avatarImage.image = UIImage(named: "light\(index)")
            backgroundColor = .gray
        }
    }
}
