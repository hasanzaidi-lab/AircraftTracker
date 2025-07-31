//
//  DataModel.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 5/9/25.
//

import Foundation

struct OpenSkyDataModel: Codable {
    let time: Int
    let states: [State]
}

struct State: Codable {
    let icao24: String         // "39de4e"
    let callsign: String       // "TVF67BM"
    let originCountry: String  // "France"
    let timePosition: Int?
    let lastContact: Int?
    let longitude: Double?
    let latitude: Double?
    let baroAltitude: Double?
    let onGround: Bool
    let velocity: Double?
    let trueTrack: Double?
    let verticalRate: Double?
    let geoAltitude: Double?
    let squawk: String?
    let spi: Bool
    let positionSource: Int

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        icao24 = try container.decode(String.self)
        callsign = try container.decode(String.self)
        originCountry = try container.decode(String.self)
        timePosition = try container.decodeIfPresent(Int.self)
        lastContact = try container.decodeIfPresent(Int.self)
        longitude = try container.decodeIfPresent(Double.self)
        latitude = try container.decodeIfPresent(Double.self)
        baroAltitude = try container.decodeIfPresent(Double.self)
        onGround = try container.decode(Bool.self)
        velocity = try container.decodeIfPresent(Double.self)
        trueTrack = try container.decodeIfPresent(Double.self)
        verticalRate = try container.decodeIfPresent(Double.self)

        // sensors is null in the data, so we'll just decode as optional
        _ = try container.decodeNil() // skip null
        geoAltitude = try container.decodeIfPresent(Double.self)
        squawk = try container.decodeIfPresent(String.self)
        spi = try container.decode(Bool.self)
        positionSource = try container.decode(Int.self)
    }
}
