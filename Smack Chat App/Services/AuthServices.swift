//
//  AuthServices.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 13/01/22.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias Completion = (_ success: Bool) -> Void

class AuthServices {
    static let shared = AuthServices()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.setValue(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.setValue(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.setValue(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping Completion) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: String] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { response in
            
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.error?.localizedDescription ?? "")
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping Completion) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: String] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseData { response in
            
            if response.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let json = try JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    
                } catch let error {
                    print(error)
                }
                
                self.isLoggedIn = true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.error?.localizedDescription ?? "")
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping Completion) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: String] = [
            "name:": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(AuthServices.shared.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        AF.request(URL_CREATE_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
            
            if response.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let json = try JSON(data: data)
                    let id = json["_id"].stringValue
                    let avatarColor = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let email = json["email"].stringValue
                    let name = json["name"].stringValue
                    
                    UserDataService.shared.setUserData(id: id, name: name, email: email, avatarName: avatarName, avatarColor: avatarColor)
                    
                } catch let error {
                    print(error)
                }
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.error?.localizedDescription ?? "")
            }
        }
    }
}
