//
//  ViewController.swift
//  iFarmer
//
//  Created by pVasilchenko on 19.10.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var iFarmer = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iFarmer"
        
        iFarmer.append(Animal(kind: "Horse", name: "Debra", age: "2", food: ["gress and plants","hey", "grains", "concentrate mixes", "salt and minerals", "fruits and vegetables (treats)"], careProcedures: ["wash", "comb", "hoof caring"]))
        iFarmer.append(Animal(kind: "Goat", name:"Mashka", age: "5", food: ["gress and plants","hey", "grains", "fruits and vegetables"], careProcedures: ["wash", "comb", "hoof caring"]))
        iFarmer.append(Animal(kind: "Sheep", name: "Molli", age: "4", food: ["gress and plants","hey", "grains", "fruits and vegetables"], careProcedures: ["wash", "comb", "hoof caring"]))
        iFarmer.append(Animal(kind: "Hen", name: "Adolf", age: "0.5", food:["grass", "grains", "fruits"], careProcedures: ["grafts"]))
        iFarmer.append(Animal(kind: "Duck", name: "Donald", age: "0.2", food: ["grass", "grains", "fruits"], careProcedures: ["grafts"]))
        iFarmer.append(Animal(kind: "Dog", name: "Barsik", age: "4", food: ["meet", "bones", "feed-stuff", "leftovers"], careProcedures: ["wash", "comb", "grafts"]))
        iFarmer.append(Animal(kind: "Cat", name: "Sima", age: "5", food: ["fish", "feed-stuff", "meat", "leftovers"], careProcedures: ["wash", "comb", "grafts"]))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iFarmer.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let animal = iFarmer[indexPath.row]
        cell.textLabel?.text = animal.kind
        cell.detailTextLabel?.text = animal.name
        cell.imageView?.image = UIImage(named: "\(animal.kind)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            navigationController?.pushViewController(vc, animated: true)
            vc.animal = iFarmer[indexPath.row]
        }
    }
    
}

