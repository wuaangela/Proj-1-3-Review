//
//  ViewController.swift
//  Proj 1-3 Review
//
//  Created by Angela Wu  on 2019-06-27.
//  Copyright © 2019 Angela Wu . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let country = countries[indexPath.row]
        let image = UIImage(named: country)
        
        cell.imageView?.image = image
        cell.textLabel?.text = country
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            vc.selectedCountry = countries[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }


}

