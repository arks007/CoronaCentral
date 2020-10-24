//
//  AuthViewController.swift
//  CoronaCentral
//
//  Created by Sujoy Purkayastha on 10/24/20.
//  Copyright © 2020 Sujoy Purkayastha. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    @IBOutlet weak var AppLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the transparencies of all the components on the screen to 0 to make it invisible
        self.AppLabel.alpha = 0.0
        self.emailLabel.alpha = 0.0
        self.passwordLabel.alpha = 0.0
        self.emailTextField.alpha = 0.0
        self.passwordTextField.alpha = 0.0
        self.signInButton.alpha = 0.0
        self.signUpLabel.alpha = 0.0
        self.signUpButton.alpha = 0.0
        
        // Fade in each component sequentially
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.AppLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
            self.emailLabel.alpha = 1
            self.emailTextField.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
            self.passwordLabel.alpha = 1
            self.passwordTextField.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseIn, animations: {
            self.signInButton.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseIn, animations: {
            self.signUpLabel.alpha = 1
            self.signUpButton.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func signIn(_ sender: Any) {
        
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
