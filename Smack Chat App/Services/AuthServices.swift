//
//  AuthServices.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 13/01/22.
//

import Foundation
import Alamofire

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
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: String] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { response in
            
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.error?.localizedDescription ?? "")
            }
        }
    }
}
