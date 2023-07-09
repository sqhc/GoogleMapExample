//
//  ViewController.swift
//  GoogleMapExample
//
//  Created by 沈清昊 on 7/9/23.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
        GMSServices.provideAPIKey("AIzaSyCLJ4Fl4jMlk_H4urqS-zP-cHThssNKFEs")
        
        print("Licsense: \n\n\(GMSServices.openSourceLicenseInfo())")
    }


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        let coordinate = location.coordinate
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // User current location at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
