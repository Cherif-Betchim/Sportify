//
//  ProgrameViewController.swift
//  Sportify
//
//  Created by etudiant on 03/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class ProgrameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sportName = ["Natation", "Tennis", "Golf", "BodyBuilding", "Football"]
    
    let sportImage = [UIImage(named: "natation"),UIImage(named: "tenis"),UIImage(named: "golf"),UIImage(named: "body"),UIImage(named: "foot")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sportName.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath) as! SportsCollectionViewCell
		cell.sportName.text = sportName[indexPath.row]
		cell.sportImage.image = sportImage[indexPath.row]
		return cell
	}


    
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let sportdet = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            sportdet.image = sportImage[indexPath.row]!
            sportdet.name = sportName[indexPath.row]
            self.navigationController?.pushViewController(sportdet , animated: true )
        }
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
