//
//  Secrets.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 6/15/25.
//

import Foundation

struct Secrets {
    static var aviationStackAPIKey: String {
        getKey(named: "AviationStackAPIKey")
    }

    static var rapidAPIKey: String {
        getKey(named: "RapidAPIKey")
    }

    static var rapidAPIHost: String {
        getKey(named: "RapidAPIHost")
    }

    private static func getKey(named key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let value = dict[key] as? String else {
            fatalError("❌ '\(key)' not found in Secrets.plist")
        }
        return value
    }
}
