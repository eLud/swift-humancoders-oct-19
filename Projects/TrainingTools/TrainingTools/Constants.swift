//
//  Constants.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 11/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Constants {

    struct NotificationNames {
        static let locationUpdated = Notification.Name("locationUpdated")
    }

    struct DateFormatters {
        static let mediumDateShortTime: DateFormatter = {
            let f = DateFormatter()
            f.dateStyle = .medium
            f.timeStyle = .short
            return f
        }()
    }

    struct UserDefaults {
        static let userName = "usernameUserDefaultKey"
        static let trackinPrecision = "trackinPrecisionUserDefaultKey"
        static let isTrackingEnabled = "isTrackingEnabledUserDefaultKey"
    }
}
