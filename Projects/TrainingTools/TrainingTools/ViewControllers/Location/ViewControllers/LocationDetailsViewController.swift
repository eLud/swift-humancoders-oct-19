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

        mapView.delegate = self
        configureUI(with: location)
    }

    /// Function to configure the UI according to a location
    /// - Parameter location: The location to configure the view with
    private func configureUI(with location: Location) {

        self.title = Constants.DateFormatters.mediumDateShortTime.string(from: location.timestamp)
        mapView.addAnnotation(location.annotation)
        mapView.setCenter(location.annotation.coordinate, animated: true)
    }

    @IBAction func showItinerary(_ sender: Any) {

        let coordinates = LocationService.shared.locations.map({CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)})

        let polyLine = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.addOverlay(polyLine)
    }
}

extension LocationDetailsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
             let testlineRenderer = MKPolylineRenderer(polyline: polyline)
             testlineRenderer.strokeColor = .blue
             testlineRenderer.lineWidth = 2.0
             return testlineRenderer
         }
        return MKOverlayRenderer()
    }

    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print(views)
    }
}
