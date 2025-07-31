//
//  MainTabView.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 6/15/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            AirportListView()
                .tabItem {
                    Label("Airports", systemImage: "airplane")
                }
            
            DepartingFlightListViewControllerNav(iataCode: "")
                .tabItem {
                    Label("Departures", systemImage: "airplane.departure")
                }
            ArrivingFlightViewControllerNav(iataCode: "")
                .tabItem {
                    Label("Arrivals", systemImage: "airplane.arrival")
                }
        }
    }
}
