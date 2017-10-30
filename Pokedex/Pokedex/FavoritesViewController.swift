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
        let defaults = UserDefaults.standard
        favorites = defaults.object(forKey:"Favorites") as? [String] ?? [String]()
        
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//    }
    
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
