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
    @IBOutlet weak var userImg: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    
    //ovo smo uradili da bi na gasenje aplikacijie i ponovno pokretanje ostali ulogvani 2
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthServices.instance.isLoggedIn {
            // show profile page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            
            present(profile, animated: true, completion: nil)
            
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
        ////pozivamo Utilities > Constants > let to_login
        //performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
            setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthServices.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instacne.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instacne.avatarName)
            userImg.backgroundColor = UserDataService.instacne.returnUIColor(components: UserDataService.instacne.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "profileDefault")
            userImg.backgroundColor = UIColor.clear
        }
    }

}
