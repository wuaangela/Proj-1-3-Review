//
//  DetailViewController.swift
//  Proj 1-3 Review
//
//  Created by Angela Wu  on 2019-06-27.
//  Copyright © 2019 Angela Wu . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var selectedCountry: String?

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        title = selectedCountry

        // set up image
        if let country = selectedCountry {
            let countryImage = UIImage(named: country)
            imageView.image = countryImage
        }
        
        // set up nav bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        vc.modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
    }
    

}


