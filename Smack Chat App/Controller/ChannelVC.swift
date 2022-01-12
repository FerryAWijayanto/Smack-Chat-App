//
//  ChannelVC.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 11/01/22.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        revealViewController().rearViewRevealWidth = view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @IBAction func prepareUnwindSegue(segue: UIStoryboardSegue) {}
    
}
