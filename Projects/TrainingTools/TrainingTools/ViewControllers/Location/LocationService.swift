//
//  LocationService.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

class LocationService {

    //Use a singleton
    static let shared = LocationService()

    var locations: [Location] = [Location(latitude: 0, longitude: 0, timestamp: Date())]

}
