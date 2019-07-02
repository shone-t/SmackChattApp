//
//  AuthServices.swift
//  Smack
//
//  Created by MacBook Pro on 7/2/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire

//ovo ce biti singlton, globalno dostupan i datom trenutku moze biti samo jedan primerak
class AuthServices {
    
    static let instance = AuthServices()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
/*    funkcija za kreiranje novog user-a
 za potrebe ove funkcije smo importovali Alamofire */
    
    func registerUser(email: String, password: String, complition: @escaping CompletionHandler)  {
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                complition(true)
            } else {
                complition(false)
                debugPrint(response.result.error as Any )
            }
        }
        
        
    }
    
    
}
