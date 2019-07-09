//
//  MessageService.swift
//  Smack
//
//  Created by MacBook Pro on 7/8/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {

//        ovo sam morao da dodam bilo koji da bi radilo
//                let body: [String: Any] = [
//            "name": "drugi nasilno dodat",
//            "description": "opis drugog"
//        ]
//        Alamofire.request(URL_ADD_CHANNELS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
//
//            if response.result.error == nil {
//                print("proslo dodavanje")
//            } else {
//                print("nije proslo",response.result.error as? String)
//            }
//        }
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
// decodable JSON decoder ide sa do catch blokom
                
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
//                print(self.channels)
// tradicionalni nacin
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue

                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        //let channel = Channel(_id: id, name: name, description: channelDescription, __v: 1)
                        self.channels.append(channel)
                    }
//                    print(self.channels)
//                    print(self.channels[0].channelTitle)
//                    print("prosao ovo 333")
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    func clearChannels(){
        channels.removeAll()
    }
}
