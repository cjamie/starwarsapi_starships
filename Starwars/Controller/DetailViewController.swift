//
//  DetailViewController.swift
//  Starwars
//
//  Created by Admin on 12/25/17.
//  Copyright © 2017 Jamie Chu. All rights reserved.
//

import UIKit


class DetailViewController:UIViewController{
    var person:Person?
    var planet:Planet?
    
    @IBOutlet weak var detailImgView: UIImageView!

    override func viewDidLoad() {
        print("in detail view")
        if let person = person{
            print(person)
        }
        if let planet = planet{
            print(planet)
        }
    }
    
    
    
}

typealias TableViewFunctionsDetail7 = DetailViewController
extension TableViewFunctionsDetail7:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") else {
            fatalError("No cell in tableView")
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 16
    }

}

