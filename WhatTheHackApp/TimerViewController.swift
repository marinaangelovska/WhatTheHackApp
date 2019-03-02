//
//  TimerViewController.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var scannerLabel: UILabel!
    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var smallImage: UIImageView!
    @IBOutlet weak var bigImage: UIImageView!
    var seconds = 10
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrCodeImage.isHidden = true
        scannerLabel.isHidden = true
        makeImageRound(image: smallImage)
        makeImageRound(image: bigImage)
        timer.invalidate()
        seconds = 10
        timerLabel.text = timeString(time: TimeInterval(seconds))
        runTimer()
    }
    
    //MARK: Custom functions
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    @objc func updateTimer() {
        seconds = seconds - 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
        if(seconds == 0) {
            timer.invalidate()
            qrCodeImage.isHidden = false
            scannerLabel.isHidden = false
            bigImage.isHidden = true
            smallImage.isHidden = true
            timerLabel.isHidden = true
            
        }
    }
    
    func makeImageRound(image: UIImageView) {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
    }
    


}
