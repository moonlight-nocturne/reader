//
//  ViewController.swift
//  Calculator
//
//  Created by sodas on 2/28/16.
//  Copyright © 2016 sodas. All rights reserved.
//

import Foundation
import UIKit

// MARK: Main Body

class ViewController: UIViewController {
    @IBOutlet weak var text1: UILabel!
    
    var pr = PureTextNote()
    var filept = 0
    var counter = 0
    var ucounter:UInt64 = 0
    var fileHandle : FileHandle?
    
    @IBAction func test1(_ sender: UIButton) {
        //let titleList = PureTextNote.titleOfSavedNotes()
        //guard let firstNote = try? PureTextNote.open(title: titleList.first!) else { exit(1) }
        //self.text1.text = firstNote.content
        self.filept = 0
        self.counter = 0
    }
    
    @IBAction func test2(_ sender: UIButton) {
        let titleList = PureTextNote.titleOfSavedNotes()
        guard let firstNote = try? PureTextNote.open(title: titleList.first!) else { exit(1) }
        self.counter = 0
        self.filept += 10
        var tempstr = ""
        if let aStreamReader = StreamReader(path: firstNote.fileURL.path) {
            defer {
                aStreamReader.close()
            }
            
            while let line = aStreamReader.nextLine() {
                if counter>=filept-10&&counter<filept{
                    tempstr = tempstr + line
                }
                counter = counter+1
                if counter>=filept{
                    break
                }
            }
            self.text1.text = tempstr
        }
    }
    
    @IBAction func test3(_ sender: UIButton) {
        let titleList = PureTextNote.titleOfSavedNotes()
        guard let firstNote = try? PureTextNote.open(title: titleList.first!) else { exit(1) }
        //var tempstr = ""
        guard let fileHandle = FileHandle(forReadingAtPath: firstNote.fileURL.path) else { exit(1) }
        fileHandle.seek(toFileOffset: ucounter)
        let buffer = fileHandle.readData(ofLength: 1024)
        guard let tempstr = String(data: buffer, encoding: String.Encoding.utf8) else { exit(1) }
        self.text1.text = tempstr
        ucounter += 1024
        print("test3")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.lineBreakMode = NSLineBreakMode.byWordWrapping
        text1.numberOfLines = 0
    }
    
    
    
}

