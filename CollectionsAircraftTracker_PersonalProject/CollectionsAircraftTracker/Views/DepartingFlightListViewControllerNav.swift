import SwiftUI
import UIKit

struct DepartingFlightListViewControllerNav: UIViewControllerRepresentable {
    var iataCode: String

    func makeUIViewController(context: Context) -> DepartingFlightListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DepartingFlightListViewController") as! DepartingFlightListViewController
        vc.iataCode = iataCode
        return vc
    }

    func updateUIViewController(_ uiViewController: DepartingFlightListViewController, context: Context) {}
}
