//
//  DetailViewController.swift
//  iFarm
//
//  Created by pVasilchenko on 19.10.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//
import SafariServices
import UIKit

class DetailViewController: UITableViewController {
    var animal: Animal!

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var food: UILabel!
    @IBOutlet var careProcedures: UILabel!
    
    @IBOutlet var vaccinatedTag: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = animal.kind
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        let readMore = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(readMoreTapped))
        navigationItem.rightBarButtonItems = [share, readMore]
        imageView.image = UIImage(named: animal.kind)
        name.text = animal.name
        age.text = "Age: " + animal.age
        food.text = "Food: " + animal.food.joined(separator: ", ")
        careProcedures.text = "Care: " + animal.careProcedures.joined(separator: ", ")
        setVaccinatedLabel()
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    @objc func shareTapped(){
        let items: [Any] = [animal.kind, animal.name, animal.age, imageView.image!]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(vc, animated: true)
    }
    @objc func readMoreTapped(){
        if let url = URL(string: "https://a-z-animals.com/animals/\(animal.kind)/"){
            //UIApplication.shared.open(url)
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    func setVaccinatedLabel(){
        let defaults = UserDefaults.standard
        let vaccinated = defaults.object(forKey:"Vaccinated") as? [String] ?? [String]()
        
        if vaccinated.contains(animal.kind){
            vaccinatedTag.text = "Remove from vaccinated"
        }else{
            vaccinatedTag.text = "Add to vaccinated"
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5{
            tableView.deselectRow(at:indexPath, animated: true)
            
            let defaults = UserDefaults.standard
            var vaccinated = defaults.object(forKey: "Vaccinated") as? [String] ?? [String]()
            
            if let index = vaccinated.index(of: animal.kind){
                vaccinated.remove(at:index)
            }else{
                vaccinated.append(animal.kind)
            }
            defaults.set(vaccinated, forKey: "Vaccinated")
            setVaccinatedLabel()
        }
    }
}
