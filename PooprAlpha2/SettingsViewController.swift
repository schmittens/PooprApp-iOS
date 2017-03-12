//
//  SettingsViewController.swift
//  PooprAlpha2
//
//  Created by C Schilter on 23.10.16.
//  Copyright © 2016 justincase. All rights reserved.
//

import UIKit
import MapKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var POISwitch: UISwitch!
    @IBOutlet weak var buildingSwitch: UISwitch!
    @IBOutlet weak var mapTypeSelector: UISegmentedControl!
    
    @IBOutlet weak var paySwitch: UISwitch!
    @IBOutlet weak var freeSwitch: UISwitch!
    @IBOutlet weak var handicappedSwitch: UISwitch!
    @IBOutlet weak var changingRoomSwitch: UISwitch!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var showerSwitch: UISwitch!
    

    @IBAction func POISwitchToggled(_ sender: AnyObject) {
        if POISwitch.isOn {
            ViewController.MapViewState.mapShowsPOI = true
        }
        else {
            ViewController.MapViewState.mapShowsPOI = false
        }
    }
    
    @IBAction func buildingSwitchToggled(_ sender: AnyObject) {
        if buildingSwitch.isOn {
            ViewController.MapViewState.mapShowsBuildings = true
        }
        else {
            ViewController.MapViewState.mapShowsBuildings = false
        }
    }
    
    
    @IBAction func mapTypeSelected(_ sender: AnyObject) {
        switch mapTypeSelector.selectedSegmentIndex {
        case 0:
            ViewController.MapViewState.mapTypeValue = 0
        case 1:
            ViewController.MapViewState.mapTypeValue = 1
        case 2:
            ViewController.MapViewState.mapTypeValue = 2
        default:
            ViewController.MapViewState.mapTypeValue = 0
        }
    }
    
    
    
    @IBAction func genderSelected(_ sender: UISegmentedControl) {
        switch genderSelector.selectedSegmentIndex {
        case 0: // female
            ViewController.DataViewState.gender = 0
        case 1: // male
            ViewController.DataViewState.gender = 1
        case 2: // unisex
            ViewController.DataViewState.gender = 2
        default: // default to unisex
            ViewController.DataViewState.gender = 2
        }
    }

    @IBAction func paySwitchToggled(_ sender: UISwitch) {
        if paySwitch.isOn {
            ViewController.DataViewState.pay = true
        }
        else {
            ViewController.DataViewState.pay = false
        }
    }
    
    @IBAction func freeSwitchToggled(_ sender: UISwitch) {
        if freeSwitch.isOn {
            ViewController.DataViewState.free = true
        }
        else {
            ViewController.DataViewState.free = false
        }
    }
    
    @IBAction func handicappedSwitchToggled(_ sender: UISwitch) {
        if handicappedSwitch.isOn {
            ViewController.DataViewState.handicapped = true
        }
        else {
            ViewController.DataViewState.handicapped = false
        }
    }
    
    @IBAction func changingRoomToggled(_ sender: UISwitch) {
        if changingRoomSwitch.isOn {
            ViewController.DataViewState.changingRoom = true
        }
        else {
            ViewController.DataViewState.changingRoom = false
        }
    }

    @IBAction func showerSwitchToggled(_ sender: UISwitch) {
        if showerSwitch.isOn {
            ViewController.DataViewState.shower = true
        }
        else {
            ViewController.DataViewState.shower = false
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // check and set button states
        self.buildingSwitch.isOn = ViewController.MapViewState.mapShowsBuildings
        self.POISwitch.isOn = ViewController.MapViewState.mapShowsPOI
        self.mapTypeSelector.selectedSegmentIndex = ViewController.MapViewState.mapTypeValue
        
        self.genderSelector.selectedSegmentIndex = ViewController.DataViewState.gender
        self.paySwitch.isOn = ViewController.DataViewState.pay
        self.freeSwitch.isOn = ViewController.DataViewState.free
        self.handicappedSwitch.isOn = ViewController.DataViewState.handicapped
        self.changingRoomSwitch.isOn = ViewController.DataViewState.changingRoom
        self.showerSwitch.isOn = ViewController.DataViewState.shower
    }
    

}
