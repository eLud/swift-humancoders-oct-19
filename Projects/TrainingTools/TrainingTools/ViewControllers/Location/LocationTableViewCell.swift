//
//  LocationTableViewCell.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 10/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    // Called after the loading
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with location: Location) {

        let dateString = Constants.DateFormatters.mediumDateShortTime.string(from: location.timestamp)
        self.dateLabel.text = dateString

        addressLabel.text = "Lat : \(location.latitude), Long : \(location.longitude)"
    }
}
