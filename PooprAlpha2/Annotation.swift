//
//  Annotation.swift
//  PooprAlpha2
//
//  Created by C Schilter on 22.10.16.
//  Copyright © 2016 justincase. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }
}
