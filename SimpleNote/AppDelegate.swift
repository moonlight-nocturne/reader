//
//  AppDelegate.swift
//  SimpleNote
//
//  Created by sodas on 4/30/17.
//  Copyright © 2017 sodastsai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        var newNote = PureTextNote()
        var cont:String
        //let url = URL(string: "https://cdn.fbsbx.com/v/t59.2708-21/18281575_1324180084285966_6140894121847422976_n.txt/txttw_q_9847.txt?oh=0833a249fd06eb6f1ce8636a0560850a&oe=59147646&dl=1")
        let url = URL(string: "https://cdn.fbsbx.com/v/t59.2708-21/18219948_1324960664207908_5163162044026847232_n.txt/the-ultimate-crisis.txt?oh=ef2ac832310a15d051efecd7c82d5ba1&oe=59159316&dl=1")
        cont = try! String(contentsOf: url!)
        newNote.content = cont
        newNote.title = "New note."
        try? newNote.save()
        //try? PureTextNote.remove(title: "New note.")
        print("Notes would be saved in '\(PureTextNote.storageURL.path)'.")
        print("----------------------------")
        let titleList = PureTextNote.titleOfSavedNotes()
        print("Now we have \(titleList)")
        print("----------------------------")
        //guard let firstNote = try? PureTextNote.open(title: titleList.first!) else { exit(1) }
        //print(firstNote.content)
        return true
    }

}
