//
//  ViewController.swift
//  PooprAlpha2
//
//  Created by C Schilter on 22.10.16.
//  Copyright © 2016 justincase. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation


class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var zoomSlider: UISlider!
    
    var locationManager:CLLocationManager?
    var currentLocation:CLLocation?
    
    struct MapViewState {
        static let minimumZoom: Int = 100
        static let maximumZoom: Int = 10000
        static var mapTypeValue: Int = 0
        static var mapShowsBuildings: Bool = true
        static var mapShowsPOI: Bool = true
        static var showsUserLocation: Bool = true
        static var distanceFilter: CLLocationDistance = CLLocationDistance(50)
        static var animationSpeed: Double = 1.0
        static var movementSpeed: Double = 0.0
        static var trackingUser: Int = 1
        static var latLongDistance: CLLocationDistance = 1000
        static var currentLocation: CLLocationCoordinate2D?
        static var currentMapCenter: CLLocationCoordinate2D?
        //static var region = MKCoordinateRegionMakeWithDistance(ViewController.MapViewState.currentLocation!, ViewController.MapViewState.latLongDistance, ViewController.MapViewState.latLongDistance)
    }
    
    struct DataViewState {
        static var gender: Int = 2
        static var free: Bool = true
        static var pay: Bool = true
        static var handicapped: Bool = true
        static var changingRoom: Bool = false
        static var babyChangingStation: Bool = false
        static var shower: Bool = false
        static var mDR: AnyObject?
    }
    
    struct UserAdminInfo {
        static var udid: String = UIDevice.current.identifierForVendor!.uuidString
        static var device: String = UIDevice.current.model
        static var devicename: String = UIDevice.current.name
        static var systemOS: String = UIDevice.current.systemName
        static var systemVersion: String = UIDevice.current.systemVersion
    }
    
    struct InteractWithData {
        struct Create {
            
        }
        
        struct Rate {
            static var fid: Int?
            static var user: String = ViewController.UserAdminInfo.udid
            static var rating: Int?
            
        }
        
        struct Challenge {
            
        }
        
        struct Update {
            
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        print(ViewController.UserAdminInfo.device)
        print(ViewController.UserAdminInfo.devicename)
        print(ViewController.UserAdminInfo.systemVersion)
        print(ViewController.UserAdminInfo.systemOS)
        
        // Update locationmanager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.pausesLocationUpdatesAutomatically = true
        locationManager?.distanceFilter = ViewController.MapViewState.distanceFilter
        locationManager?.startUpdatingLocation()
        
        
        //zoomSlider.value = Float(ViewController.MapViewState.latLongDistance) / Float(ViewController.MapViewState.maximumZoom)
        zoomSlider.minimumValue = 2.0
        zoomSlider.maximumValue = 4.0
        zoomSlider.value = log10(Float(ViewController.MapViewState.latLongDistance))
        //zoomSlider.value = 3.0
        
        // configure initial mapView
        mapView.mapType = MKMapType(rawValue: UInt(ViewController.MapViewState.mapTypeValue ))!
        mapView.showsBuildings = ViewController.MapViewState.mapShowsBuildings
        mapView.showsUserLocation = ViewController.MapViewState.showsUserLocation
        mapView.showsPointsOfInterest = ViewController.MapViewState.mapShowsPOI
        mapView.setUserTrackingMode(MKUserTrackingMode(rawValue: ViewController.MapViewState.trackingUser)!, animated: true)
        mapView.updateFocusIfNeeded()
        //mapView.setRegion(ViewController.MapViewState.region, animated: true)
        
        // TRY TO USE mapView(MKMapView, didChange: MKUserTrackingMode, animated: Bool)
        
        //let userPin = Annotation(title: "Title", subtitle: "Subtitle", coordinate: location)
        
        //mapView.addAnnotation(userPin)
    }

    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("LocationManager fired")
        self.currentLocation = locations[0]
        ViewController.MapViewState.currentLocation = locations[0].coordinate
        
        ViewController.MapViewState.movementSpeed = (locationManager?.location?.speed)!
        
        locationManager?.distanceFilter = ViewController.MapViewState.distanceFilter
        
        ViewController.MapViewState.currentMapCenter = mapView.centerCoordinate

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
    }

    @IBAction func settingsButton(_ sender: AnyObject) {
    }
    
    @IBAction func centerViewOnUserPosition(_ sender: UIButton) {
        ViewController.MapViewState.currentMapCenter = ViewController.MapViewState.currentLocation
        
        zoomSlider.value = 3.0
        ViewController.MapViewState.latLongDistance = CLLocationDistance(pow(Double(10), Double(zoomSlider.value)))
        //zoomSlider.value = log10(Float(ViewController.MapViewState.latLongDistance))
        
        mapView.setUserTrackingMode(MKUserTrackingMode(rawValue: 1)!, animated: true)

    }

    
    @IBAction func zoomSliderButton(_ sender: UISlider) {
        ViewController.MapViewState.latLongDistance = CLLocationDistance(pow(Double(10), Double(zoomSlider.value)))

        let region = MKCoordinateRegionMakeWithDistance(ViewController.MapViewState.currentMapCenter!, ViewController.MapViewState.latLongDistance, ViewController.MapViewState.latLongDistance)
        
        mapView.setRegion(region, animated: true)
        
        print(region.span)
        
    }
    
    
}


