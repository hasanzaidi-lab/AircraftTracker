import SwiftUI

struct AirportListView: View {
    @StateObject private var viewModel = AirportListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.filteredAirports) { airport in
                NavigationLink(destination: DepartingFlightListViewControllerNav(iataCode: airport.iataCode ?? "")) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(airport.name ?? "Unknown Airport")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(airport.iataCode ?? "N/A")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(.insetGrouped)
            .searchable(text: $viewModel.searchText, prompt: "Search airports")
            .navigationTitle("Select Airport")
        }
    }
}
