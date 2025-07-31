//
//  Airport.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 6/15/25.
//

import Foundation

struct AirportDatamodel: Identifiable, Decodable {
    let id = UUID()
    let name: String?
    let iataCode: String?
    let icao: String?

    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case icao = "icao_code"
    }
}
