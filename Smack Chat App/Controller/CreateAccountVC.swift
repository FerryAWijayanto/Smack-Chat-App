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
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDataService.shared.avatarName != "" {
            userProfile.image = UIImage(named: UserDataService.shared.avatarName)
            avatarName = UserDataService.shared.avatarName
        }
    }
    
    @IBAction func createAccountBtn(_ sender: UIButton) {
        guard let name = usernameTF.text, name != "" else { return }
        guard let email = emailTF.text, email != "" else { return }
        guard let password = passwordTF.text, password != "" else { return }
        
        AuthServices.shared.registerUser(email: email, password: password) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                AuthServices.shared.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { success in
                    if success {
                        self.performSegue(withIdentifier: UNWIND_TO_CHANNELS, sender: nil)
                    }
                }
            }
        }
        
    }
    
    @IBAction func chooseAvatarBtn(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackgroundBtn(_ sender: UIButton) {
        
    }
    @IBAction func dismissBtn(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNELS, sender: nil)
    }
    
}
