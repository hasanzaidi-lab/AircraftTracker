// FlightListViewController.swift
import UIKit

class DepartingFlightListViewController: UIViewController, UITableViewDelegate {

    var iataCode: String?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private let viewModel = FlightListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        viewModel.setMode(from: tabBarItem.title)
             
        Task {
            await viewModel.fetchFlights(for: iataCode ?? "")
            print(iataCode)
            tableView.reloadData()
        }
    }
}

extension DepartingFlightListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(query: searchText)
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(query: "")
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension DepartingFlightListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.flights.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as? DepartureTableViewCell else {
            fatalError("Could not dequeue FlightTableViewCell")
        }

        let flight = viewModel.flights[indexPath.row]
        cell.departFlightNumberLabel.text = flight.number
        cell.departureTImeLabel.text = flight.movement?.scheduledTime?.local?.split(separator: " ").dropFirst().first?.split(separator: "-").first.map(String.init) ?? "N/A"
        cell.arrivalCityLabel.text = flight.movement?.airport?.name ?? "Unknown"
        return cell
    }
}
