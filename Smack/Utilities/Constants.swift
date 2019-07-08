//
//  Constants.swift
//  Smack
//
//  Created by MacBook Pro on 6/28/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://shonechat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_ADD_CHANNELS = "\(BASE_URL)channel/add"

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5036386986)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Segues
//Dali smo segue izmedju login dugmeta i login forme ovaj id = "toLogin" sto nas je povezalo u Chanell.vs
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccoutn"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL =  "userEmail"



//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
let  BEARER_HEADER = [
    "Authorization":"Bearer \(AuthServices.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
