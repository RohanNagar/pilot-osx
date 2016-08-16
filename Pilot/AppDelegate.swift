//
//  AppDelegate.swift
//  Pilot
//
//  Created by Rohan Nagar on 9/26/15.
//  Copyright © 2015 Sanction. All rights reserved.
//

import Cocoa
import FileKit
import Locksmith

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var window: NSWindow!

  var loginViewController: LoginViewController!

  func applicationDidFinishLaunching(aNotification: NSNotification) {

    loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)

    // Set the window color
    window.backgroundColor = NSColor.fromRGB(255.0, green: 255.0, blue: 255.0)

    let defaults = NSUserDefaults.standardUserDefaults()

    // If there is an existing user then try to grab the password for that user from KeyChain
    if let username = defaults.stringForKey("existingUser") {
      if let existingUserInfo = Locksmith.loadDataForUserAccount(username) {
        let password = existingUserInfo["password"] as! String
        loginViewController.signIn(self.window, username: username, password: password)
        return
      }
    }

    // Disable window resize for the login window
    window.styleMask &= ~NSResizableWindowMask

    // Add the loginView Controller to the contentView
    window.contentViewController = loginViewController
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application

  }

}

extension NSView {

  func bindFrameToSuperviewBounds() {
    guard let superview = self.superview else {
      return
    }

    self.translatesAutoresizingMaskIntoConstraints = false
    superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": self]))
  }

}
