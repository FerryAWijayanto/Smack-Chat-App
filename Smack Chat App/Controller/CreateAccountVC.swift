//
//  CreateAccountVC.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 12/01/22.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var userProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountBtn(_ sender: UIButton) {
        guard let email = emailTF.text, email != "" else { return }
        guard let password = passwordTF.text, password != "" else { return }
        
        AuthServices.shared.registerUser(email: email, password: password) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                print("register user!")
            }
        }
        
    }
    
    @IBAction func chooseAvatarBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func generateBackgroundBtn(_ sender: UIButton) {
        
    }
    @IBAction func dismissBtn(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNELS, sender: nil)
    }
    
}
