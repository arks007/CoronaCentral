//
//  SignUpViewController.swift
//  CoronaCentral
//
//  Created by Sujoy Purkayastha on 10/24/20.
//  Copyright © 2020 Sujoy Purkayastha. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confPasswordLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        confPasswordTextField.isSecureTextEntry = true
    }
    
    // perform this function when the user hits the register button
    @IBAction func register(_ sender: Any) {
        // Check our input
        if(firstNameTextField.text == ""){
            let controller = UIAlertController(title: "Registration Error", message: "Please enter your first name", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        if(lastNameTextField.text == ""){
            let controller = UIAlertController(title: "Registration Error", message: "Please enter your last name", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        if(emailTextField.text == ""){
            let controller = UIAlertController(title: "Registration Error", message: "Please enter an email", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        if(passwordTextField.text == ""){
            let controller = UIAlertController(title: "Registration Error", message: "Please enter a password", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        if(confPasswordTextField.text == ""){
            let controller = UIAlertController(title: "Registration Error", message: "Please confirm your password", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        if(confPasswordTextField.text != passwordTextField.text){
            let controller = UIAlertController(title: "Registration Error", message: "Your passwords don't match", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
        guard let strongSelf = self else { return }
            if error != nil {
                let controllerError = UIAlertController(title: "Oops!", message: "Please fix your information!", preferredStyle: .alert)
                controllerError.addAction(UIAlertAction(title: "ok", style: .default, handler: {(action) in print("FAILURE")}))
                    strongSelf.present(controllerError, animated: true, completion: nil)
                }
            }

        
        
        let controller = UIAlertController(title: "Success", message: "Your account was successfully created! You may now login", preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "ok", style: .default, handler: {(action) in self.dismiss(animated: true, completion: nil)}))
            self.present(controller, animated: true, completion: nil)
    }


}
