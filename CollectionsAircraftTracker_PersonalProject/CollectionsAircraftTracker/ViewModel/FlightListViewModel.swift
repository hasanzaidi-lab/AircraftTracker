// FlightListViewModel.swift
import Foundation

final class FlightListViewModel {

    enum Mode {
        case arrivals
        case departures
    }

    @Published var flights: [Flight] = []
    @Published var filteredFlights: [Flight] = []

    private var allFlights: [Flight] = []
    private let network = NetworkLayer()
    private(set) var mode: Mode = .arrivals

    func setMode(from title: String?) {
        mode = (title == "Departures") ? .departures : .arrivals
    }

    func fetchFlights(for airportIATACode: String) async {
        guard let url = URL(string: "https://aerodatabox.p.rapidapi.com/flights/airports/iata/\(airportIATACode)") else { return }

        var request = URLRequest(url: url)
        
        request.addValue(Secrets.rapidAPIHost, forHTTPHeaderField: "x-rapidapi-host")
        request.addValue(Secrets.rapidAPIKey, forHTTPHeaderField: "x-rapidapi-key")

        do {
            let flightData: FlightDataModel = try await network.doApiCall(urlRequest: request)
            DispatchQueue.main.async {
                switch self.mode {
                case .arrivals: self.allFlights = flightData.arrivals ?? []
                case .departures: self.allFlights = flightData.departures ?? []
                }
                self.flights = self.allFlights
            }
        } catch {
            print("❌ Error fetching flights: \(error)")
        }
    }

    func search(query: String) {
        guard !query.isEmpty else {
            flights = allFlights
            return
        }
        flights = allFlights.filter {
            $0.number.lowercased().contains(query.lowercased()) ||
            ($0.movement?.airport?.name?.lowercased().contains(query.lowercased()) ?? false)
        }
    }
}
