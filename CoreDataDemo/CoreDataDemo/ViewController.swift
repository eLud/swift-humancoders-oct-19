//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Ludovic Ollagnier on 11/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        create()
        get()
    }

    func create() {

        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext

        let editor = Editor(context: context)
        editor.name = "Hachette"

        let author = Author(context: context)
        author.firstName = "Jules"
        author.lastName = "César"
        author.salary = 0
        author.addToEditors(editor)

        let book = Book(context: context)
        book.title = "Il était une fois Swift"
        book.sumary = "Un super bouquin"
        book.numberOfPages = 100
        book.author = author

        try? context.save()
    }

    func get() {

        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title CONTAINS %@", "fois")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]

        if let results = try? context.fetch(fetchRequest) {
            print(results)
            print("")
        }
    }

}

