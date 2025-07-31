
import UIKit
import Combine

class ArrivingFlightViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    private let viewModel = FlightListViewModel()
    private let airportViewModel = AirportListViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        setupViewModel()
    }

    private func setupUI() {
        tableView.dataSource = self
        searchBar.delegate = self
    }

    private func setupViewModel() {
        viewModel.setMode(from: self.tabBarItem.title)  // "Arrivals"
        Task {
            await viewModel.fetchFlights(for: airportViewModel.searchText)
        }
    }

    private func bindViewModel() {
        viewModel.$flights
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: - UITableViewDataSource
extension ArrivingFlightViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.flights.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArrivalCell", for: indexPath) as? ArrivalTableViewCell else {
            fatalError("❌ Could not dequeue ArrivalTableViewCell")
        }

        let flight = viewModel.flights[indexPath.row]

        cell.arriveFlightNumber.text = flight.number
        cell.departedCityLabel.text = flight.movement?.airport?.name ?? "Unknown"
        if let dateString = flight.movement?.scheduledTime?.local {
            let components = dateString.split(separator: " ")
            cell.arrivalTimeLable.text = components.count > 1 ? String(components[1]) : "N/A"
        } else {
            cell.arrivalTimeLable.text = "N/A"
        }

        return cell
    }
}

// MARK: - UISearchBarDelegate
extension ArrivingFlightViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(query: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.search(query: "")
        searchBar.resignFirstResponder()
    }
}
