//
//  MapViewController.swift
//  PointsOfInterest
//
//  Created by Michelle on 11/11/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        //Create a map view
        mapView = MKMapView()
        
        //Set it as the view of this view controller
        view = mapView
        
        let segmentedController = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedController.backgroundColor = UIColor.systemBackground
        segmentedController.selectedSegmentIndex = 0
        
        segmentedController.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedController)
        
        let topConstraint = segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedController.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedController.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        //Label
        let switchLabel = UILabel()
        switchLabel.text = "Point of Intrests"
        
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchLabel)
        
        let labelTop = switchLabel.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 8)
        let labelLeading = switchLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        labelTop.isActive = true
        labelLeading.isActive = true
        
        //Switch
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.setOn(true, animated: true)
        switchControl.addTarget(self, action: #selector(poiDisplay(_:)), for: .valueChanged)
        
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchControl)
        
        let topSwitch = switchControl.topAnchor.constraint(equalTo: segmentedController.bottomAnchor, constant: 8)
        
        let leadingSwitch = switchControl.leadingAnchor.constraint(equalTo: switchLabel.trailingAnchor, constant: 12)
        
        topSwitch.isActive = true
        leadingSwitch.isActive = true
        
        //Find me button
        let buttonControl = UIButton()
        buttonControl.backgroundColor = UIColor.white
        buttonControl.layer.cornerRadius = 2
        buttonControl.setTitle("Find Me", for: .normal)
        buttonControl.setTitleColor(UIColor.black, for: .normal)
        buttonControl.layer.borderWidth = 1
        
        buttonControl.addTarget(self, action: #selector(buttonZoom(_:)), for: .touchDown)
        buttonControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonControl)
        
        let topButton = buttonControl.topAnchor.constraint(equalTo: switchLabel.bottomAnchor, constant: 8)
        let leadingButton = buttonControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let buttonWidth = buttonControl.widthAnchor.constraint(equalToConstant: buttonControl.titleLabel!.intrinsicContentSize.width + 2.0 * 3)
        
        topButton.isActive = true
        leadingButton.isActive = true
        buttonWidth.isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func poiDisplay(_ poiSwitch: UISwitch){
        if(poiSwitch.isOn){
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [])
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
        }
    }
    
    @objc func buttonZoom(_ zoomButton: UIButton){
        print("Button Pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }

}
