//
//  MessageCell.swift
//  Smack
//
//  Created by MacBook Pro on 7/9/19.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instacne.returnUIColor(components: message.userAvatarColor)
        timeStampLbl.text = convertDateFormater(date: message.timeStamp)
    }
    
    

    
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "dd.MM HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: date)
        
        return timeStamp
    }
}




