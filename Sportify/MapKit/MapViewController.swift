//
//  MapViewController.swift
//  Sportify
//
//  Created by Chloé Marquet on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit
import MapKit
import SwiftUI

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var lieux = [Lieux]()
    var isAlreadyCenter = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        mapView.showsUserLocation = true
        
        // Nous centrons la carte sur la latitude et la longitude passée en paramètre
        let center = CLLocationCoordinate2D(latitude: 45.19193413, longitude: 5.72666532)
        centerMap(onLocation: center)
        
        var lieu = Lieux(name: "Paul Smit", latitude: 45.192349, longitude: 5.731061)
        lieux.append(lieu)
        
        lieux.forEach { lieu in
            
            // Nous créons une annotation customisée
            let annotation = CustomAnnotation()
            
            // annotation.id = "id-1"
            annotation.coordinate = CLLocationCoordinate2D(latitude: lieu.latitude, longitude: lieu.longitude)
            annotation.title = lieu.name
            annotation.subtitle = "Football"
        
            mapView.addAnnotation(annotation)
        }
        
        checkLocationServices()
    }
    
    
    func centerMap(onLocation location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region,animated: true)
    }
    
    
    //MARK: -- Annotations --
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))
            
            let rightButton = UIButton(type: .infoLight)
            rightButton.tag = annotation.hash
            
            let width = pinView.layer.frame.size.width
            let height = pinView.layer.frame.size.height
            let widthExpected = 50;
            
            let resizeHeight = height * (CGFloat(widthExpected) * 100 / width) / 100
            
            
            pinView.animatesDrop = true
            pinView.canShowCallout = true
            pinView.rightCalloutAccessoryView = rightButton
            
            pinView.image = UIImage(named: "paul-smit")
            pinView.layer.frame = CGRect(x: pinView.layer.frame.origin.x, y: pinView.layer.frame.origin.y, width: 50 , height: resizeHeight)

            
            pinView.layer.cornerRadius = pinView.layer.frame.size.height/2
            
            
            return pinView
            
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //check if the authorization services is ok
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
        } else{
            showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
        }
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied:
            showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            showAlert(title: "Alerte", message: "Vous devez autoriser la localisation GPS pour utiliser l'application")
            break
        case .authorizedAlways:
            break
            
        }
    }
    //verify differents permissions
    func locationManager(_ manager:CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        checkLocationAuthorization()
    }
    
    //update the position of the user when he move and show buses points with itineraire
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        if !isAlreadyCenter {
            DispatchQueue.main.async {
                let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                self.centerMap(onLocation: center)
                self.isAlreadyCenter = true
            }
        }
        
        
    }
}
