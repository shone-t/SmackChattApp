//
//  LoginVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/28/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        //gasenje novog view koji je pokrenut kroz segue iz drugog view
        dismiss(animated: true, completion: nil)
    }
    
}
