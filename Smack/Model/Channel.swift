//
//  Channel.swift
//  Smack
//
//  Created by MacBook Pro on 7/8/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation

struct Channel {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
//ovo je za json decod koji je komentarisan u messageService
//struct Channel : Decodable {
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int?
//}
