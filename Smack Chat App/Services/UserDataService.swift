//
//  UserDataService.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 13/01/22.
//

import Foundation

class UserDataService {
    
    static let shared = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    
    func setUserData(id: String, name: String, email: String, avatarName: String, avatarColor: String) {
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
    }
    
    func setAvatarName(name: String) {
        self.avatarName = name
    }
    
}
