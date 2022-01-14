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
    
    func setUserData(dict: [String: Any]) {
        self.id = dict["_id"] as? String ?? ""
        self.name = dict["name"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.avatarName = dict["avatarName"] as? String ?? ""
        self.avatarColor = dict["avatarColor"] as? String ?? ""
    }
    
    func setAvatarName(name: String) {
        self.avatarName = name
        
    }
    
}
