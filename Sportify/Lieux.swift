//
//  Lieux.swift
//  Sportify
//
//  Created by Chloé Marquet on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import Foundation
import MapKit

class Lieux {
    var name: String!
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
