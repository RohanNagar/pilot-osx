//
//  PilotUser.swift
//  Pilot
//
//  Created by Rohan Nagar on 10/18/15.
//  Copyright © 2015 Sanction. All rights reserved.
//

import Cocoa

class PilotUser: NSObject {
  var username: String
  var password: String
  var facebookAccessToken: String
  var twitterAccessToken: String
  var twitterAccessSecret: String
  
  init(username: String, password: String, facebookAccessToken: String, twitterAccessToken: String, twitterAccessSecret: String) {
    self.username = username
    self.password = password
    self.facebookAccessToken = facebookAccessToken
    self.twitterAccessToken = twitterAccessToken
    self.twitterAccessSecret = twitterAccessSecret
  }
  
  
}
