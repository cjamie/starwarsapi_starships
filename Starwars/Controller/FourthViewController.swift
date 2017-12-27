//
//  FourthViewController.swift
//  Starwars
//
//  Created by Admin on 12/25/17.
//  Copyright © 2017 Jamie Chu. All rights reserved.
//

import UIKit
//Vehicles
class FourthViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    
    var vehicleArr = [Vehicle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in fourth view did load")
        loadAllVehicles(curr: "https://swapi.co/api/vehicles")
    }
    
    func loadAllVehicles(curr:String){
        Networking.getVehicle(byPage: curr) {
            [unowned self](vehicle, error) in
            print("we are outside")
            //TODO: Account for error cases
            guard error == nil else{
                print("error")
                print(error!.localizedDescription)
                return
            }
            guard let vehicle1 = vehicle?.results else {return }
            
            let _ = vehicle1.map{self.vehicleArr.append($0)}
            guard let nextLoad = vehicle?.next else {
                self.tableView.reloadData()
                return
            }
            self.loadAllVehicles(curr: nextLoad)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

typealias TableViewFunctions4 = FourthViewController
extension TableViewFunctions4: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell") as? CustomVehicleCell else {
            fatalError("No cell in tableView")
        }
        cell.setPlaceholder()
        //there is currently no vehicle image
        cell.loadVehicleImage(fromName: vehicleArr[indexPath.row].name.replacingOccurrences(of: " ", with: "").folding(options: .diacriticInsensitive, locale: .current))
        cell.myName1.text = vehicleArr[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
