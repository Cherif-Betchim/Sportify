//
//  DetailsViewController.swift
//  Sportify
//
//  Created by etudiant on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController{

    @IBOutlet weak var sportDetailimg: UIImageView!
    @IBOutlet weak var label: UILabel!

    var image = UIImage()
    var name  = ""
    let sportPrograme = ["Default programe", "Tennis", "Golf", "BodyBuilding", "Football"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Add a new " + name + " programe"
        sportDetailimg.image = image
    }
    

   
    @IBAction func onClickAdd(_ sender: UIButton) {
    }
    


}
