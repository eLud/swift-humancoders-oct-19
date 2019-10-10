//
//  User.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 09/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

protocol Person {
    var firstName: String { get }
    var lastName: String { get }
    var age: Int { get set }

    func greet()
}

extension Person {
    func greet() {
        print("Hello")
    }
}

struct User: Person {
    let firstName: String
    let lastName: String
    var age: Int = 0

    var dogName: String?
}

struct Friend: Person {
    var firstName: String
    var lastName: String
    var age: Int = 0

    func greet() {
        print("Salut")
    }
}

struct Config {

    var everybody: [Person] = [User(firstName: "L", lastName: "O"), Friend(firstName: "R", lastName: "L")]

    func boucle() {
        for e in everybody {
            if let user = e as? User {
                user.dogName
            } else if let friend = e as? Friend {
                friend.age
            }

            e.greet()
        }
    }
}
