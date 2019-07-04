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

// Segues
//Dali smo segue izmedju login dugmeta i login forme ovaj id = "toLogin" sto nas je povezalo u Chanell.vs
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccoutn"
let UNWIND = "unwindToChannel"


//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL =  "userEmail"



//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
