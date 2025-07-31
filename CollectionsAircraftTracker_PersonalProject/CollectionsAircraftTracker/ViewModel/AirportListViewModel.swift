import Foundation
import Combine

final class AirportListViewModel: ObservableObject {
    @Published var airports: [AirportDatamodel] = []
    @Published var searchText: String = ""

    var filteredAirports: [AirportDatamodel] {
        if searchText.isEmpty {
            return airports
        } else {
            return airports.filter {
                ($0.name?.localizedCaseInsensitiveContains(searchText) == true) ||
                ($0.iataCode?.localizedCaseInsensitiveContains(searchText) == true)
            }
        }
    }

    init() {
        loadAirportsFromLocalJSON()
    }

    private func loadAirportsFromLocalJSON() {
        guard let url = Bundle.main.url(forResource: "airports", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("❌ Failed to load local airports.json")
            return
        }

        do {
            let decoded = try JSONDecoder().decode([AirportDatamodel].self, from: data)
            self.airports = decoded
                .filter { ($0.iataCode?.isEmpty == false) }
                .sorted { ($0.name ?? "") < ($1.name ?? "") }
        } catch {
            print("❌ Decoding error: \(error)")
        }
    }
}
