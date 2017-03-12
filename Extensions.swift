//
//  Extensions.swift
//  PooprAlpha2
//
//  Created by C Schilter on 22.10.16.
//  Copyright © 2016 justincase. All rights reserved.
//

import MapKit

extension MKMapView {
    func animatedZoom(zoomRegion:MKCoordinateRegion, duration:TimeInterval) {
        MKMapView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.setRegion(zoomRegion, animated: true)
            }, completion: nil)
    }
}
