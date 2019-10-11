//
//  Location.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation
import MapKit

struct Location: Codable {

    let latitude: Double
    let longitude: Double
    let timestamp: Date

    var annotation: LocationAnnotation {
        return LocationAnnotation(location: self)
    }
}

//Class wrapper
class LocationAnnotation: NSObject, MKAnnotation {

    var location: Location

    var title: String? {
        return Constants.DateFormatters.mediumDateShortTime.string(from: location.timestamp)
    }

//    var subtitle: String
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }

    init(location: Location) {
        self.location = location
    }
}
