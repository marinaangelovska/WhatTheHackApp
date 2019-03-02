//
//  StartingViewController.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit
import UserNotifications

class StartingViewController: UIViewController {

    @IBOutlet weak var startSearchingButton: UIButton!
    let alert = UIAlertController(title: nil, message: "We are looking for your future friend...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonRound(button: startSearchingButton)
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        loadingScreen()
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when){

            ViewController.notificationShow()
        }
    
    }
    
    func makeButtonRound(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 3
        button.layer.borderColor = button.titleLabel?.textColor.cgColor;
        
    }

    func loadingScreen() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: {(
            self.performSegue(withIdentifier: "segue1", sender: self) )})
        
    }
   

    

}
