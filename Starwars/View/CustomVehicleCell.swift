//
//  CustomVehicleCell.swift
//  Starwars
//
//  Created by Admin on 12/26/17.
//  Copyright © 2017 Jamie Chu. All rights reserved.
//

import UIKit

class CustomVehicleCell: UITableViewCell{
    
    
    @IBOutlet weak var myImage1: UIImageView!
    @IBOutlet weak var myName1: UILabel!
    
    func loadVehicleImage(fromName name:String) {
        if let image = GlobalCache.shared.imgCache.object(forKey:name as NSString){
            self.myImage1.image = image
            return
        }
        
        Networking.downloadVehicleImage(byName: name, completion: { (image, error) in
            guard error == nil else {return}
            guard let image = image else{return}
            GlobalCache.shared.imgCache.setObject(image,forKey: name as NSString)
            
            DispatchQueue.main.async {
                self.myImage1.image = image
            }
        })
    }
    
    func setPlaceholder(){
        self.myImage1.image = #imageLiteral(resourceName: "frog")
    }
}

