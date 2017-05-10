//
//  NotesViewController.swift
//  SimpleNote
//
//  Created by rin on 2017/5/10.
//  Copyright © 2017年 sodastsai. All rights reserved.
//

import Foundation
import UIKit

class NotesViewController : UIViewController, UITextViewDelegate {
    
    @IBOutlet var textView : UITextView!
    var placeholderLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
