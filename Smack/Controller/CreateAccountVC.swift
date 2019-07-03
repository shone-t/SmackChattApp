//
//  CreateAccountVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/30/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
//create my outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != "" else {return}
        
        
        AuthServices.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print ("registered user!")
            }
        }
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
//        dismiss(animated: true, completion: nil	)
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    


}
