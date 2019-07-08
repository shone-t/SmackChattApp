//
//  ChatVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/26/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        //menuBtn.addTarget(self.SWRevealViewController, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        //ovo smo uradili da bi na gasenje aplikacijie i ponovno pokretanje ostali ulogvani 1
        if AuthServices.instance.isLoggedIn {
            AuthServices.instance.findUserByEmail(complition: {(success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil )
            })
        }
        MessageService.instance.findAllChannel { (success) in
            
        }
    }
    
    
}
