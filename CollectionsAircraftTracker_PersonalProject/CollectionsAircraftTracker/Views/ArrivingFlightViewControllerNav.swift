//
//  ArrivingFlightViewControllerNav.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 6/15/25.
//

import Foundation
import SwiftUI
import UIKit

struct ArrivingFlightViewControllerNav: UIViewControllerRepresentable {
    var iataCode: String

    func makeUIViewController(context: Context) -> ArrivingFlightViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ArrivingFlightViewController") as! ArrivingFlightViewController
        // if you later add `vc.iataCode = iataCode`, do it here
        return vc
    }

    func updateUIViewController(_ uiViewController: ArrivingFlightViewController, context: Context) {}
}
