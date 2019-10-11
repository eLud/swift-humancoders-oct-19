//
//  LocationsTableViewController.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController, LocationServiceDelegate {

    var locationService = LocationService.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        locationService.delegate = self
    }

    // MARK: - Actions

    @IBAction func addLocation(_ sender: UIBarButtonItem) {

        //Get a new location and update the tableView
        locationService.fetchCurrentLocation()
    }

    @IBAction func startTracking(_ sender: Any) {
        locationService.trackLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //To pass data

        if segue.identifier == "showDetails" {

            guard let destination = segue.destination as? LocationDetailsViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let location = locationService.locations[indexPath.row]

            destination.location = location
        }

        //Identifier la location à passer
        //Passer la location à la map
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

    func locationServiceDidUpdateLocations() {
        tableView.reloadData()
    }
    
}
