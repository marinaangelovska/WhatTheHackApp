//
//  ViewController.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var foundButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        makeButtonRound(button: chatButton)
        makeButtonRound(button: foundButton)
    }
    
    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
       
        return cell
    }
    
    //MARK: Custom functions
    func makeButtonRound(button: UIButton) {
    
        button.backgroundColor = .clear
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    //MARK: IBActions
    
    @IBAction func chatButtonPressed(_ sender: Any) {
    }
}

