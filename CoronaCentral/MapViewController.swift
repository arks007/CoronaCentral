//
//  MapViewController.swift
//  CoronaCentral
//
//  Created by Sujoy Purkayastha on 10/24/20.
//  Copyright © 2020 Sujoy Purkayastha. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var queryTextField: UITextField!
    @IBAction func submit(_ sender: Any) {
        if(annotations.count != 0){
            createAnnotations(locations: annotations)
        }
    }
    
    // global vars to details modal
    var modalTitle = String()
    
    // response data as a swift array
    var responseData = [
        ["title": "Ruth's Chris Steak House", "latitude": 30.267150, "longitude": -97.743060],
        ["title": "CVS Pharmacy", "latitude": 30.2673835, "longitude": -97.7434424],
        ["title": "Gold's Gym", "latitude": 30.2675981, "longitude": -97.7414296],
    ]
    
    // list of results
    var annotations = [
        ["title": "Ruth's Chris Steak House", "latitude": 30.267150, "longitude": -97.743060],
        ["title": "CVS Pharmacy", "latitude": 30.2673835, "longitude": -97.7434424],
        ["title": "Gold's Gym", "latitude": 30.2675981, "longitude": -97.7414296],
    ]
    
    // var responseData:[[String: Any]]
    
    func createAnnotations(locations: [[String: Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotations)
        }
    }
    
    func clearAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
        annotations = []
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation as? MKPointAnnotation
        guard let title = annotation?.title else {
            return
        }
        print(title)
        
        modalTitle = getAnnotationData(title: title)["title"] as! String
        self.performSegue(withIdentifier: "DetailSegue", sender: nil)
    }

    func getAnnotationData(title: String) -> [String: Any] {
        for element in responseData {
            if(title == element["title"] as? String){
                return element
            }
        }
        return ["Error": -1]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        queryTextField.placeholder = "McDonalds"
        
        queryTextField.backgroundColor = UIColor.white
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        mapView.delegate = self
        overrideUserInterfaceStyle = .dark
        
        let initialLocation = CLLocation(latitude: 30.26715, longitude: -97.74306)
        mapView.centerToLocation(initialLocation)
    }
    
    // Override the prepare function for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If transitioning to the text change view controller
        if segue.identifier == "DetailSegue",
            let nextVC = segue.destination as? DetailsViewController
            {
                nextVC.locationText = modalTitle
        }
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
