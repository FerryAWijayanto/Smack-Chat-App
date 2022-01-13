//
//  Constants.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 11/01/22.
//

import Foundation
import Alamofire

// URL Constants
let BASE_URL = "https://slack-smack-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

// Segue
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNELS = "unwindToChannels"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "LoggedIn"
let USER_EMAIL = "userEmail"

// Headers
let HEADER: HTTPHeaders = [
    "Content-Type": "application/json; charset=utf-8"
]
