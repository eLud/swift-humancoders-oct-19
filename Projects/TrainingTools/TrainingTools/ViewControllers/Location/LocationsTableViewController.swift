//
//  LocationsTableViewController.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {

    var locationService = LocationService.shared

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return locationService.locations.count

// In case of multiple sections
//        switch section {
//        case 0:
//            return 5
//        case 1:
//            return 2
//        case 2:
//            return 10
//        default:
//            return 0
//        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? LocationTableViewCell else {
            fatalError("Wrong cell type")
        }

        let location = locationService.locations[indexPath.row]
        cell.configure(with: location)

        return cell
    }

    
}
