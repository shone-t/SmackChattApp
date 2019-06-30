//
//  ChannelVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/26/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        //pozivamo Utilities > Constants > let to_login
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    


}
