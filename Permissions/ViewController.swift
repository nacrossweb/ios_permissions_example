//
//  ViewController.swift
//  Permissions
//
//  Created by Nicholas Cross on 30/08/2016.
//  Copyright © 2016 Nicholas Cross. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @IBOutlet
    var button: UIButton!
    
    @IBOutlet
    var escallateButton: UIButton!
    
    @IBOutlet
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.enabled = false
        escallateButton.enabled = false
        manager.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        label.text = "Permission \(CLLocationManager.authorizationStatus())"
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization()
        }
        
    }
    
    @IBAction
    func escallate(sender: UIButton) {
        manager.requestAlwaysAuthorization()
    }
    
    @IBAction
    func openSettings(sender: UIButton) {
        if CLLocationManager.authorizationStatus() == .Denied {
            if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(appSettings)
            }
        }
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        label.text = "Permission \(stringForStatus(status))"
        button.enabled = status == .Denied
        escallateButton.enabled = status == .AuthorizedWhenInUse
    }
    
    func stringForStatus(status:CLAuthorizationStatus) -> String {
        switch status {
        case .NotDetermined:
            return "NotDetermined"
        case .AuthorizedWhenInUse:
            return "AuthorizedWhenInUse"
        case .AuthorizedAlways:
            return "AuthorizedAlways"
        case .Restricted:
            return "Restricted"
        case .Denied:
            return "Denied"
        }
    }

}

