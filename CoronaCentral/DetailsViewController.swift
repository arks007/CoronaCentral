//
//  DetailsViewController.swift
//  CoronaCentral
//
//  Created by Sujoy Purkayastha on 10/24/20.
//  Copyright © 2020 Sujoy Purkayastha. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    var locationText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = locationText
        // Do any additional setup after loading the view.
    }
}
