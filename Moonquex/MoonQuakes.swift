//
//  MoonQuakes.swift
//  Moonquex
//
//  Created by Krishna Babani on 10/8/23.
//

import Foundation

struct MoonQuakes: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    let date: Date
    let depth: Double?
    let magnitude: Double?
    let station: String
    let category: String
    
    static let allMoonquakes: [MoonQuakes] = [
        MoonQuakes(latitude: 1.2, longitude: -16.49, date: Date(timeIntervalSince1970: 7201040631.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 23.42, longitude: 7.23, date: Date(timeIntervalSince1970: 7205130846.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 15.19, longitude: 20.57, date: Date(timeIntervalSince1970: 7207311808.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -17.94, longitude: -20.74, date: Date(timeIntervalSince1970: 7208292258.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 20.35, longitude: 6.49, date: Date(timeIntervalSince1970: 7309262046.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -8.88, longitude: 21.73, date: Date(timeIntervalSince1970: 7309300411.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 2.44, longitude: -8.07, date: Date(timeIntervalSince1970: 7312241003.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -49.93, longitude: 3.42, date: Date(timeIntervalSince1970: 7404191829.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -14.33, longitude: -8.95, date: Date(timeIntervalSince1970: 7407171205.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 70.76, longitude: 2.71, date: Date(timeIntervalSince1970: 7411211315.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 28.16, longitude: 37.94, date: Date(timeIntervalSince1970: 7412150907.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 7.64, longitude: -34.55, date: Date(timeIntervalSince1970: 7503052149.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 3.14, longitude: 41.61, date: Date(timeIntervalSince1970: 7504121812.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -38.17, longitude: 59.78, date: Date(timeIntervalSince1970: 7505040959.0), depth: nil, magnitude: nil, station: "12,14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -18.5, longitude: -59.98, date: Date(timeIntervalSince1970: 7601130711.0), depth: nil, magnitude: nil, station: "12, 14, 15, 16", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -9.82, longitude: -73.54, date: Date(timeIntervalSince1970: 7605280602.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: -36.4, longitude: -121.3, date: Date(timeIntervalSince1970: 7611142312.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 21.54, longitude: -85.07, date: Date(timeIntervalSince1970: 7704172332.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 33.14, longitude: 137.69, date: Date(timeIntervalSince1970: 7706282222.0), depth: nil, magnitude: nil, station: "", category: "Meteorite Moonquake"),
        MoonQuakes(latitude: 48.0, longitude: 35.0, date: Date(timeIntervalSince1970: 40719655), depth: nil, magnitude: 2.8, station: "12, 14", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 42.0, longitude: -24.0, date: Date(timeIntervalSince1970: 43608310), depth: nil, magnitude: 2.0, station: "12, 14", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 43.0, longitude: -47.0, date: Date(timeIntervalSince1970: 48086685), depth: nil, magnitude: 1.9, station: "12, 14", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 54.0, longitude: 101.0, date: Date(timeIntervalSince1970: 63239380), depth: nil, magnitude: 1.9, station: "14, 15", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 12.0, longitude: 46.0, date: Date(timeIntervalSince1970: 85588555), depth: nil, magnitude: 1.0, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 51.0, longitude: 45.0, date: Date(timeIntervalSince1970: 92531300), depth: nil, magnitude: 1.4, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -20.0, longitude: -80.0, date: Date(timeIntervalSince1970: 92721015), depth: nil, magnitude: 1.2, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 33.0, longitude: 35.0, date: Date(timeIntervalSince1970: 98059930), depth: nil, magnitude: 0.8, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -84.0, longitude: -134.0, date: Date(timeIntervalSince1970: 100857390), depth: nil, magnitude: 3.2, station: "12, 14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -1.0, longitude: -71.0, date: Date(timeIntervalSince1970: 109455720), depth: nil, magnitude: 2.2, station: "12, 14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -37.0, longitude: -29.0, date: Date(timeIntervalSince1970: 118295880), depth: nil, magnitude: 1.1, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 36.0, longitude: -16.0, date: Date(timeIntervalSince1970: 130886210), depth: nil, magnitude: 0.7, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -48.0, longitude: -106.0, date: Date(timeIntervalSince1970: 133607460), depth: nil, magnitude: 1.6, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -37.0, longitude: 42.0, date: Date(timeIntervalSince1970: 135610515), depth: nil, magnitude: 0.9, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 21.0, longitude: 88.0, date: Date(timeIntervalSince1970: 142735590), depth: nil, magnitude: 2.7, station: "12, 14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 29.0, longitude: -98.0, date: Date(timeIntervalSince1970: 157945320), depth: nil, magnitude: 3.2, station: "12, 14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 75.0, longitude: 40.0, date: Date(timeIntervalSince1970: 158728450), depth: nil, magnitude: 1.7, station: "14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -2.0, longitude: -51.0, date: Date(timeIntervalSince1970: 158804780), depth: nil, magnitude: 1.1, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -19.0, longitude: -26.0, date: Date(timeIntervalSince1970: 161561030), depth: nil, magnitude: 1.4, station: "14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -49.0, longitude: -45.0, date: Date(timeIntervalSince1970: 168676625), depth: nil, magnitude: 1.3, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 3.0, longitude: -58.0, date: Date(timeIntervalSince1970: 170465340), depth: nil, magnitude: 1.4, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -8.0, longitude: 64.0, date: Date(timeIntervalSince1970: 184837975), depth: nil, magnitude: 1.8, station: "14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 50.0, longitude: 30.0, date: Date(timeIntervalSince1970: 189602335), depth: nil, magnitude: 1.8, station: "14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 38.0, longitude: 44.0, date: Date(timeIntervalSince1970: 190282685), depth: nil, magnitude: 1.1, station: "", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 50.0, longitude: -20.0, date: Date(timeIntervalSince1970: 194955160), depth: nil, magnitude: 2.3, station: "12,14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: -19.0, longitude: -12.0, date: Date(timeIntervalSince1970: 195144130), depth: nil, magnitude: 1.8, station: "12, 14, 15, 16", category: "Shallow Moonquake"),
        MoonQuakes(latitude: 77.0, longitude: -10.0, date: Date(timeIntervalSince1970: 201097960), depth: nil, magnitude: 1.5, station: "", category: "Shallow Moonquake")

    ]
}


