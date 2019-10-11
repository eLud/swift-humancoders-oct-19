//
//  LocationDetailsViewController.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 11/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit
import MapKit



class LocationDetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var location: Location?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let location = location else {
            fatalError("No location provided")
        }

        configureUI(with: location)
    }

    /// Function to configure the UI according to a location
    /// - Parameter location: The location to configure the view with
    private func configureUI(with location: Location) {

        self.title = Constants.DateFormatters.mediumDateShortTime.string(from: location.timestamp)
    }

}
