//
//  DetailViewController.swift
//  Pokedex
//
//  Created by pVasilchenko on 18.10.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UITableViewController {

    @IBOutlet var imageView: UIImageView!
    
    var pokemon: Pokemon!
    @IBOutlet var evolution: UILabel!
    @IBOutlet var summery: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var taggleFavarites: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = pokemon.name
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        let readMore = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(readMoreTapped))
        navigationItem.rightBarButtonItems = [share, readMore]
        
        imageView.image = UIImage(named: pokemon.name)
        name.text = pokemon.name.uppercased()
        type.text = pokemon.type
        summery.text = pokemon.summery
        if pokemon.evolutions.count > 0{
        evolution.text = "\(pokemon.name) > " + pokemon.evolutions.joined(separator: ">")
        }else{
            evolution.text = pokemon.name
        }
        setFavoritesLabel()
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 3){
            return UITableViewAutomaticDimension
        }else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    @objc func shareTapped(){
        let items: [Any] = [pokemon.summery, imageView.image!]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(vc, animated: true)
    }
    @objc func readMoreTapped(){
        if let url = URL(string: "http://pokemondb.net/pokedex/\(pokemon.name)"){
            //UIApplication.shared.open(url)
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    func setFavoritesLabel(){
        let defaults = UserDefaults.standard
        let favorites = defaults.object(forKey: "Favorites") as? [String] ?? [String]()
        
        if favorites.contains(pokemon.name){
            taggleFavarites.text = "Delete frome favorites"
        }else{
            taggleFavarites.text = "Add to favorites"
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5{
            tableView.deselectRow(at: indexPath, animated: true)
            
            let defaults = UserDefaults.standard
            var favorites = defaults.object(forKey:"Favorites") as? [String] ?? [String]()
            
            if let index = favorites.index(of: pokemon.name){
                favorites.remove(at: index)
            }else{
                favorites.append(pokemon.name)
            }
            defaults.set(favorites, forKey: "Favorites")
            setFavoritesLabel()
        }
    }
}
