//
//  FifthViewController.swift
//  Starwars
//
//  Created by Admin on 12/26/17.
//  Copyright © 2017 Jamie Chu. All rights reserved.
//

import UIKit
//Films
class FifthViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    
    var filmArr = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in fourth view did load")
        loadAllFilms(curr: "https://swapi.co/api/films")
    }
    
    func loadAllFilms(curr:String){
        Networking.getFilm(byPage: curr) {
            [unowned self](film, error) in
            print("we are outside")
            //TODO: Account for error cases
            guard error == nil else{
                print("error")
                print(error!.localizedDescription)
                return
            }
            guard let film1 = film?.results else {return }
            
            let _ = film1.map{self.filmArr.append($0)}
            guard let nextLoad = film?.next else {
                self.tableView.reloadData()
                return
            }
            self.loadAllFilms(curr: nextLoad)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

typealias TableViewFunctions5 = FifthViewController
extension TableViewFunctions5: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? CustomFilmCell else {
            fatalError("No cell in tableView")
        }
        cell.setPlaceholder()
        //there is currently no film image
        cell.loadFilmImage(fromName: filmArr[indexPath.row].title.replacingOccurrences(of: " ", with: "").folding(options: .diacriticInsensitive, locale: .current))
        cell.myName.text = filmArr[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

