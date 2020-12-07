//
//  ProgrameViewController.swift
//  Sportify
//
//  Created by etudiant on 03/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class ProgrameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let sportName = ["Natation", "Tenis", "Golf", "BodyBuilding", "Football"]
    
    let sportImage = [UIImage(named: "natation"),UIImage(named: "tenis"),UIImage(named: "golf"),UIImage(named: "body"),UIImage(named: "foot")]
    
    let  sportDescription = ["la natation consiste à parcourir le plus vite possible une distance à la nage dans une piscine homologuée. La natation englobe également les épreuves de plongeon ainsi que la natation synchronisée, qui s'inspire des ballets aquatiques.","Le tennis est un sport de raquette qui oppose soit deux joueurs soit quatre joueurs qui forment deux équipes de deux.","Le golf est un sport de précision se jouant en plein air, qui consiste à envoyer une balle dans un trou à l'aide de clubs. Le but du jeu consiste à effectuer, sur un parcours défini, le moins de coups possible. Précision, endurance, technicité, concentration sont des qualités primordiales pour cette activité.","La musculation est un ensemble d'exercices physiques visant le développement des muscles squelettiques, afin d'acquérir plus de force, d'endurance, de puissance, d'explosivité ou du volume musculaire. ... La musculation est la base de la pratique du culturisme et de plusieurs sports de force comme l'haltérophilie.","Le football est un sport collectif joué entre deux équipes de onze joueurs (un gardien et dix joueurs de champ) avec un ballon sphérique. Appelé « soccer » en Amérique du Nord, il est pratiqué par 250 millions de joueurs dans plus de 200 pays, ce qui en fait le sport le plus populaire au monde."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportName.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        cell.sportName.text = sportName[indexPath.row]
        cell.sportImage.image = sportImage[indexPath.row]
        cell.sportDescription.text = sportDescription[indexPath.row]
        return cell
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
