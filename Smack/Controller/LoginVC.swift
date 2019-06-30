//
//  LoginVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/28/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        //gasenje novog view koji je pokrenut kroz segue iz drugog view
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
