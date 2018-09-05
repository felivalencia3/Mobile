//
//  ViewController.swift
//  LocationApp
//
//  Created by Felipe Valencia  on 9/4/18.
//  Copyright © 2018 Felipe Valencia . All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    //MARK: Properties
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    let locationManager = CLLocationManager()
    @IBAction func getLocation(_ sender: UIButton) {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            let lat = String(locValue.latitude)
            let long = String(locValue.longitude)
            latitude.text = lat
            longitude.text = long
            
        }
    
}

