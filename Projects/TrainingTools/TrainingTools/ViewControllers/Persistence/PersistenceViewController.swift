//
//  PersistenceViewController.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 11/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class PersistenceViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var precisionSlider: UISlider!
    @IBOutlet weak var isTrackingEnabledSwitch: UISwitch!

    let prefs = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameLabel.text = prefs.string(forKey: Constants.UserDefaults.userName)
        precisionSlider.value = prefs.float(forKey: Constants.UserDefaults.trackinPrecision)
        isTrackingEnabledSwitch.isOn = prefs.bool(forKey: Constants.UserDefaults.trackinPrecision)
    }

    //MARK: - URLSession demo
    @IBAction func downloadImage(_ sender: Any) {

        let url = URL(string: "https://developer.apple.com/home/images/hero-apple-platforms/large_2x.jpg")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            let image = UIImage(data: data)

            DispatchQueue.main.async {
                self.imageView.image = image
            }

            print("Youhoi")
        }

        //Don't forget the resume !!!!!!!!!
        task.resume()
    }

    //MARK: - UserDefaults demo
    @IBAction func userNameDidChange(_ sender: UITextField) {
        prefs.set(sender.text, forKey: Constants.UserDefaults.userName)
    }

    @IBAction func precisionDidChange(_ sender: UISlider) {
        prefs.set(sender.value, forKey: Constants.UserDefaults.trackinPrecision)
    }

    @IBAction func trackingStatusDidChange(_ sender: UISwitch) {
        prefs.set(sender.isOn, forKey: Constants.UserDefaults.isTrackingEnabled)
    }

    //MARK: - Archive demo

    @IBAction func loadLocations(_ sender: UIButton) {
        guard let data = readFrom(fileName: "saveJson") else {
            return
        }

        let decoder = JSONDecoder()
        guard let locations = try? decoder.decode([Location].self, from: data) else { return }

        LocationService.shared.locations = locations
    }

    @IBAction func saveLocations(_ sender: UIButton) {

        let locations = LocationService.shared.locations

        let encoderJson = JSONEncoder()
        let encoderPlist = PropertyListEncoder()
        encoderPlist.outputFormat = .xml

        let dataJson = try? encoderJson.encode(locations)
        let dataPlist = try? encoderPlist.encode(locations)

        print(String(data: dataJson!, encoding: .utf8)!)
        print(String(data: dataPlist!, encoding: .utf8)!)

        if let json = dataJson {
            saveToDisk(data: json, fileName: "saveJson")
        }

        if let plist = dataPlist {
            saveToDisk(data: plist, fileName: "savePlist")
        }
    }

    private func saveToDisk(data: Data, fileName: String) {
        let fileManager = FileManager.default
        let documentUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

        let fileUrl = documentUrl.appendingPathComponent(fileName)
        try? data.write(to: fileUrl)
    }

    private func readFrom(fileName: String) -> Data? {
        let fileManager = FileManager.default
        let documentUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

        let fileUrl = documentUrl.appendingPathComponent(fileName)
        let data = try? Data(contentsOf: fileUrl)
        return data
    }
}
