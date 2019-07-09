//
//  ChannelVC.swift
//  Smack
//
//  Created by MacBook Pro on 6/26/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.channelsLoaded(_:)), name: NOTIF_CHANNELS_LOADED, object: nil) // ovo nam treba kada upalimo tek aplikaciju i nemamo nekada kanale, pa da posaljemo notifikaciju i da se relaoduju kanali u tabeli, zato je napravljena funkcija channelsLoaded
        
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        //i ovo je na kraju dodato kako bi slusali sve poruke i znali po svim kanalima kada nam dodje poruka
        SocketService.instance.getChatMessage { (newMessage) in
            if newMessage.channelID != MessageService.instance.selectedChannel?.id && AuthServices.instance.isLoggedIn {
                MessageService.instance.unreadChannels.append(newMessage.channelID)
                self.tableView.reloadData()
            }
        }
    }
    
    
    //ovo smo uradili da bi na gasenje aplikacijie i ponovno pokretanje ostali ulogvani 2
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    @IBAction func addChannelPressed(_ sender: Any) {
        
        if AuthServices.instance.isLoggedIn {
            let addChannel = AddChannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
        }
        
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
    
    @objc func channelsLoaded(_ notif: Notification) {
        tableView.reloadData()
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
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = channel
        
        if MessageService.instance.unreadChannels.count > 0 {
            MessageService.instance.unreadChannels = MessageService.instance.unreadChannels.filter{$0 != channel.id}
        }
        let index = IndexPath(row: indexPath.row, section: 0)
        tableView.reloadRows(at: [index], with: .none)
        tableView.selectRow(at: index, animated: false, scrollPosition: .none)
        
        NotificationCenter.default.post(name: NOTIF_CHANNEL_SELECTED, object: nil)
        self.revealViewController()?.revealToggle(animated: true)
    }
}
