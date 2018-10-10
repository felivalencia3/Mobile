 import UIKit
 import MapKit
 
 class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    /*
     NY:
     40.759211
     -73.984638
     
     SF:
     37.7873589
     -122.408227
  */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let SF = locations.last! as CLLocation
        print("SF Lat: \(SF.coordinate.latitude)")
        print("SF Long: \(SF.coordinate.longitude)")
        let lat2: CLLocationDegrees = 40.759211
        print("NY Lat: \(lat2)")
        let long2: CLLocationDegrees = -73.984638
        print("NY Long: \(long2)")
        let NY: CLLocation = CLLocation(latitude: lat2, longitude: long2)
        let distance = ceil(NY.distance(from: SF))
        print("The Distance between SF and NY in meters is: ",distance)
        
    }
 }
