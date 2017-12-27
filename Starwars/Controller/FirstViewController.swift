//
//  ViewController.swift
//  Starwars
//
//  Created by Admin on 12/24/17.
//  Copyright © 2017 Greg Dominguez. All rights reserved.
//
import Alamofire
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("in view did load")
        
        
        Networking.getPerson { (person, error) in
            guard error == nil else{
                //do some stuff here
                return
            }
            guard let person = person else{return}
            print(person)
            
            print("****")
//            print(person.name)
//            print("trimmed:")
            let byName = person.name.replacingOccurrences(of: " ", with: "")
            
            
            Networking.downloadImage(byName: byName, completion: { (image, error) in

                

                
//                GlobalCache.shared.myImage = image
//                DispatchQueue.main.async {
//                    self.myImage.image = image
//                }
            })
            
            
        }
//    Networking.getPlanet(byInt: 1)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

