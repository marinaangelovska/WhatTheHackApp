//
//  CustomTableViewCell.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var secondMedalImage: UIImageView!
    @IBOutlet weak var firstMedalImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        makeImageRound(image: firstMedalImage)
        makeImageRound(image: secondMedalImage)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeImageRound(image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }

}
