//
//  AddViewController.swift
//  PooprAlpha2
//
//  Created by C Schilter on 23.10.16.
//  Copyright © 2016 justincase. All rights reserved.
//

import UIKit
import MapKit

class AddViewController: UIViewController {
    
    var mapView: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.mapView ?? "No MapView")
        // Do any additional setup after loading the view.
    }



    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func abortToMapButton(_ sender: AnyObject) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passMapView = self.mapView
        if let ViewController = segue.destination as? ViewController {
            ViewController.mapView = passMapView
        }
    }

}
