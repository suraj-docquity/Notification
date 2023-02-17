//
//  ViewController.swift
//  Notification
//
//  Created by Suraj Jaiswal on 17/02/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step 1:
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound], completionHandler: {(granted,error) in
             
        })
        
        // step 2: Ceate notification content
        let content = UNMutableNotificationContent()
        content.title = "Notification Header"
        content.body = "Notification Body"
        
        // step 3: Create notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger =  UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // step 4: Create notification request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // step 5: Register request
        center.add(request)
    }


}

