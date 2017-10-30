//
//  ViewController.swift
//  Pokedex
//
//  Created by pVasilchenko on 18.10.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pokedex = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pokedex"
        
        pokedex.append(Pokemon(name: "Pidgey", type: "Strong / Flying", summery: "Pidgey is pure XP gold", evolutions: ["Pidgeotto", "Pidjeot"]))
        pokedex.append(Pokemon(name: "Spearow", type: "Normal / Flying", summery: "cast a spell on you", evolutions: ["Ferow"]))
        pokedex.append(Pokemon(name: "Cirill", type: "Strong / Smasher", summery: "Srongest pokemon ever", evolutions: ["Jerusalem"]))
        pokedex.append(Pokemon(name: "Jynx", type: "Phisycal", summery: "Is remarkably engry", evolutions: []))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pokemon = pokedex[indexPath.row]
        cell.textLabel?.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.type
        cell.imageView?.image = UIImage(named: "\(pokemon.name)-Thumb")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            navigationController?.pushViewController(vc, animated: true)
            vc.pokemon = pokedex[indexPath.row]
        }
    }


}

