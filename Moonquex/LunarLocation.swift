//
//  LunarLocation.swift
//  Moonquex
//
//  Created by Krishna Babani on 10/8/23.
//

import SwiftUI

struct LunarLocation {
    let name: String
    let latitude: Double
    let longitude: Double
    let category: Category
    
    enum Category: String {
        case mare = "square.fill"
        case crater = "triangle.fill"
        case mountain = "mount.fill"
        case apollo = "circle.fill"
        
        var sfSymbolName: String {
            return self.rawValue
        }
    }
}

let lunarLocations: [LunarLocation] = [
    LunarLocation(name: "Mare Frigoris", latitude: 56.0, longitude: 3.0, category: .mare),
    LunarLocation(name: "Mare Imbrium", latitude: 33, longitude: 25.6, category: .mare),
    LunarLocation(name: "Mare Serenitatis", latitude: 28.0, longitude: -22.5, category: .mare),
    LunarLocation(name: "Mare Vaporum", latitude: 13.3, longitude: -10.6, category: .mare),
    LunarLocation(name: "Mare Tranquillitatis", latitude: 4.5, longitude: -120, category: .mare),
    LunarLocation(name: "Mare Crisium", latitude: 17.0, longitude: 140, category: .mare),
    LunarLocation(name: "Mare Nectaris", latitude: -15.2, longitude: 35.5, category: .mare),
    LunarLocation(name: "Mare Fecunditatis", latitude: -7.8, longitude: 51.3, category: .mare),
    LunarLocation(name: "Mare Humboldtianum", latitude: 56.8, longitude: 81.5, category: .mare),
    LunarLocation(name: "Mare Anguis", latitude: 22.6, longitude: 67.7, category: .mare),
    LunarLocation(name: "Mare Marginis", latitude: 13.3, longitude: 86.1, category: .mare),
    LunarLocation(name: "Mare Undarum", latitude: 6.8, longitude: 58.4, category: .mare),
    LunarLocation(name: "Mare Spumans", latitude: 1.2, longitude: 65.1, category: .mare),
    LunarLocation(name: "Tycho", latitude: -43.3, longitude: 11.2, category: .crater),
    LunarLocation(name: "Copernicus", latitude: 9.7, longitude: -20.1, category: .crater),
    LunarLocation(name: "Clavius", latitude: -58.4, longitude: -14.4, category: .crater),
    LunarLocation(name: "Aristarchus", latitude: 23.7, longitude: -47.4, category: .crater),
    LunarLocation(name: "Plato", latitude: 51.6, longitude: -9.3, category: .crater),
    LunarLocation(name: "Montes Apenninus", latitude: 18.0, longitude: 3.0, category: .mountain),
    LunarLocation(name: "Montes Caucasus", latitude: 36.0, longitude: -10.0, category: .mountain),
    LunarLocation(name: "Montes Taurus", latitude: 27.0, longitude: 39.0, category: .mountain),
    LunarLocation(name: "Apollo 11", latitude: 3, longitude: 23.47293, category: .apollo),
    LunarLocation(name: "Apollo 12", latitude: -5.01381, longitude: -23.41930, category: .apollo),
    LunarLocation(name: "Apollo 14", latitude: -3.64544, longitude: -17.47139, category: .apollo),
    LunarLocation(name: "Apollo 15", latitude: 26.13224, longitude: 3.63400, category: .apollo),
    LunarLocation(name: "Apollo 16", latitude: -8.97341, longitude: 15.49859, category: .apollo),
    LunarLocation(name: "Apollo 17", latitude: 20.1653, longitude: 30.7658, category: .apollo)
]
