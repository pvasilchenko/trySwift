//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by pVasilchenko on 29.10.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class FavoritesViewController: UICollectionViewController {
    var favorites = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        favorites = defaults.object(forKey:"Favorites") as? [String] ?? [String]()
        
        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let pokemon = favorites[indexPath.item]
        if let imageView = cell.viewWithTag(2488) as? UIImageView{
            imageView.image = UIImage(named: pokemon)
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
