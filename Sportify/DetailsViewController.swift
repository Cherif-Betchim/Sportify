//
//  DetailsViewController.swift
//  Sportify
//
//  Created by etudiant on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var sportDetailimg: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image = UIImage()
    var name  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Add a new " + name + " programe"
        sportDetailimg.image = image
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func onClickAdd(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
