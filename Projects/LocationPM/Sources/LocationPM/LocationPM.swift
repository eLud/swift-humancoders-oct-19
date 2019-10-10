//
//  Location.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Location {

    let latitude: Double
    let longitude: Double
    let timestamp: Date
}

//
//  LocationService.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func locationServiceDidUpdateLocations()
}

class LocationService: NSObject, CLLocationManagerDelegate {

    //Use a singleton
    static let shared = LocationService()

    var delegate: LocationServiceDelegate?

    var locations: [Location] = [Location(latitude: 0, longitude: 0, timestamp: Date())]
    let locationManager = CLLocationManager()

    func fetchCurrentLocation() {
        locationManager.requestWhenInUseAuthorization()

        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 200
        locationManager.delegate = self

        locationManager.requestLocation()
        locationManager.allowsBackgroundLocationUpdates = true

        locationManager.startMonitoringVisits()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let last = locations.last else {
            return
        }

        let maLocationAMoi = Location(latitude: last.coordinate.latitude, longitude: last.coordinate.longitude, timestamp: last.timestamp)

        self.locations.append(maLocationAMoi)
        delegate?.locationServiceDidUpdateLocations()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        print(visit)
    }
}
