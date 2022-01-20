//
//  ViewController.swift
//  GoogleMapExample
//
//  Created by Roshan Sinha on 19/01/22.
//

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapViewController: UIViewController {
 
    //IBOutlets
    @IBOutlet weak var googleMapView: GMSMapView!

    // MARK: Source latitude and longitude
    let sourceLat = 28.704060
    let sourceLng = 77.102493
        
    // MARK: Destination latitude and longitude
    let destinationLat = 28.459497
    let destinationLng = 77.026634

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let googleCamera =  GMSCameraPosition.camera(withLatitude: 28.459497, longitude: 77.026634, zoom: 6.0)
        googleMapView.camera = googleCamera
        self.showMarker(position: googleMapView.camera.target)
    }

    func showMarker(position: CLLocationCoordinate2D)  {
        let marker = GMSMarker()
        marker.position = position
        marker.title = "New Delhi"
        marker.snippet = "Capital Of India"
        marker.map = googleMapView
    }
    

}



