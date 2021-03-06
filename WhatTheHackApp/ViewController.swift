//
//  ViewController.swift
//  WhatTheHackApp
//
//  Created by Marina Angelovska on 3/2/19.
//  Copyright © 2019 Marina Angelovska. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var foundButton: UIButton!
    @IBOutlet weak var shadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogoImage()
        
        makeButtonRound(button: chatButton)
        makeButtonRound(button: foundButton)
       
        UNUserNotificationCenter.current().delegate = self
     
        let topShadow = EdgeShadowLayer(
            forView: shadowView,
            edge: .Top,
            shadowRadius: 10,
            toColor: UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0),
            fromColor: UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.15)
        )
    
        let bottomShadow = EdgeShadowLayer(
            forView: shadowView,
            edge: .Bottom,
            shadowRadius: 7,
            toColor: UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0),
            fromColor: UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.15)
        )
        shadowView.layer.addSublayer(bottomShadow)
    }

    func setLogoImage() {
        let image = UIImageView.init(image: UIImage(named:"logo"))
        image.contentMode = .scaleAspectFit
        self.navigationItem.titleView = image
        
    }
    
    func makeButtonRound(button: UIButton) {
    
        button.backgroundColor = .clear
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 3
        button.layer.borderColor = button.titleLabel?.textColor.cgColor;
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .alert])
    }
    
    static func notificationShow() {
        let content = UNMutableNotificationContent()
        content.title = "Get ready!"
        content.body = "Tap to see your new spy mission!"
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Welcome", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}

public class EdgeShadowLayer: CAGradientLayer {
    
    public enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }
    
    public init(forView view: UIView,
                edge: Edge = Edge.Top,
                shadowRadius radius: CGFloat = 20.0,
                toColor: UIColor = UIColor.white,
                fromColor: UIColor = UIColor.black) {
        super.init()
        self.colors = [fromColor.cgColor, toColor.cgColor]
        self.shadowRadius = radius
        
        let viewFrame = view.frame
        
        switch edge {
        case .Top:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
            self.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: shadowRadius)
        case .Bottom:
            startPoint = CGPoint(x: 0.5, y: 1.0)
            endPoint = CGPoint(x: 0.5, y: 0.0)
            self.frame = CGRect(x: 0.0, y: viewFrame.height - shadowRadius, width: viewFrame.width, height: shadowRadius)
        case .Left:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            self.frame = CGRect(x: 0.0, y: 0.0, width: shadowRadius, height: viewFrame.height)
        case .Right:
            startPoint = CGPoint(x: 1.0, y: 0.5)
            endPoint = CGPoint(x: 0.0, y: 0.5)
            self.frame = CGRect(x: viewFrame.width - shadowRadius, y: 0.0, width: shadowRadius, height: viewFrame.height)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

