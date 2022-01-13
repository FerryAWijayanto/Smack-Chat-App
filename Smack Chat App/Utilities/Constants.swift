//
//  Constants.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 11/01/22.
//

import Foundation

// URL Constants
let BASE_URL = "https://slack-smack-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segue
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNELS = "unwindToChannels"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "LoggedIn"
let USER_EMAIL = "userEmail"
