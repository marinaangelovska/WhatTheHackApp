//
//  ChatViewController.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var typingTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogoImage()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setLogoImage() {
        let image = UIImage(named:"logo")
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:50.0, height:50.0))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    

}

class EmojiTextField: UITextField {
    
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
