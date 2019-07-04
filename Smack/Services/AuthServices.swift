//
//  AuthServices.swift
//  Smack
//
//  Created by MacBook Pro on 7/2/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
        
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                complition(true)
            } else {
                complition(false)
                debugPrint(response.result.error as Any )
            }
        }
        
        
    }
    
    func loginUser(email: String, password: String, complition: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
//                  using JSON
//                if let json = response.result.value as? Dictionary<String, Any> {
//                    if let email = json["user"] as? String {
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToken = token
//                    }
//                }
                
                
//              using SWIFT JSON
                guard let podaci = response.data else { return }
                let json = try! JSON(data: podaci)  //ovde mi trazio opciono ili implicitno da stavimo za json 'try!' ili da okruzim u DO Catch blok
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue

                self.isLoggedIn = true
                
                complition(true)
            } else {
                complition(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, complition: @escaping CompletionHandler) {
        let lowerCase = email.lowercased()
        let body: [String: Any] = [
            "name": name,
            "email": lowerCase,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let  header = [
            "Authorization":"Bearer \(AuthServices.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let podaziIzJsona = response.data else {return}
                
                let json = try! JSON(data: podaziIzJsona)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                UserDataService.instacne.setUserDataService(id: id, avatarColor: color, avatarName: avatarName, email: email, name: name)
                
                complition(true)
                
            } else {
                complition(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    
}
