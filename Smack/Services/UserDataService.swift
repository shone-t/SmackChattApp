//
//  UserDataService.swift
//  Smack
//
//  Created by MacBook Pro on 7/4/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instacne = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserDataService(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
}
