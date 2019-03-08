//
//  LoginViewController.swift
//  Instagram
//
//  Created by hor kimleng on 3/7/19.
//  Copyright © 2019 hor kimleng. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                print("Sucessfully sign in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground{ (success, error) in
            if success {
                print("Sucessfully sign up")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
}
