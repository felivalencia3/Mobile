//
//  ViewController.swift
//  MapApp
//
//  Created by Felipe Valencia  on 9/5/18.
//  Copyright © 2018 Felipe Valencia . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    //MARK: Properties
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }

    @IBAction func locateMe(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let UserLocation:CLLocation = locations[0] as CLLocation
        manager.stopUpdatingLocation()
        let coordinations = CLLocationCoordinate2D(latitude: UserLocation.coordinate.latitude, longitude: UserLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.00001, 0.00001)
        let region = MKCoordinateRegion(center: coordinations, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}

