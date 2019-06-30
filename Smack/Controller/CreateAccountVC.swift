//
//  CreateAccountVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/30/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func closePressed(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    


}
