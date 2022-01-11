//
//  ChannelVC.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 11/01/22.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        revealViewController().rearViewRevealWidth = view.frame.size.width - 60
    }
    

}
