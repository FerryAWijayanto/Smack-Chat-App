//
//  CreateAccountVC.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 12/01/22.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtn(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNELS, sender: nil)
    }
    
}
