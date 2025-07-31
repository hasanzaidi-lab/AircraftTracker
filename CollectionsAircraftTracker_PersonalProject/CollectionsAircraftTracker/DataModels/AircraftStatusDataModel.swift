//
//  AircraftStatusDataModel.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 5/20/25.
//

import Foundation

struct AircraftStatusDataModel: Decodable {
    let data: [AircraftStatusData]
}

struct AircraftStatusData: Decodable {
    let flight_date: String
    let flight_status: String
    let departure: AirportInfo
    let arrival: AirportInfo
    let airline: AirlineInfo?
    let flight: FlightInfo?
    let aircraft: AircraftInfo?
    let live: LiveInfo?
}

struct AirportInfo: Decodable {
    let airport: String?
    let iata: String?
    let icao: String?
}

struct AirlineInfo: Decodable {
    let name: String?
    let iata: String?
    let icao: String?
}

struct FlightInfo: Decodable {
    let number: String?
    let iata: String?
    let icao: String?
}

struct AircraftInfo: Decodable {
    let registration: String?
    let iata: String?
    let icao: String?
    let icao24: String?
}

struct LiveInfo: Decodable {
    let latitude: Double?
    let longitude: Double?
    let altitude: Double?
    let speed_horizontal: Double?
    let speed_vertical: Double?
    let is_ground: Bool?
}
