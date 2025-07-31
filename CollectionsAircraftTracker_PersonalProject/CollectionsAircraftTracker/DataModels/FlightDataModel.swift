//
//  FlightDataModel.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 5/20/25.
//

import Foundation

struct FlightDataModel: Decodable {
    let departures: [Flight]?
    let arrivals: [Flight]?
}

struct Flight: Decodable {
    let number: String
    let callSign: String?
    let status: String
    let aircraft: Aircraft?
    let airline: Airline
    let movement: Movement?
}

struct Aircraft: Decodable {
    let reg: String?
    let modeS: String?
    let model: String?
}

struct Airline: Decodable {
    let name: String?
    let iata: String?
    let icao: String?
}

struct Movement: Decodable {
    let airport: Airport?
    let scheduledTime: FlightTime?
    let revisedTime: FlightTime?
    let runwayTime: FlightTime?
    let terminal: String?
    let gate: String?
    let baggageBelt: String?
    let runway: String?
    let quality: [String]
}

struct Airport: Decodable {
    let icao: String?
    let iata: String?
    let name: String?
    let timeZone: String?
}

struct FlightTime: Decodable {
    let utc: String?
    let local: String?
}
