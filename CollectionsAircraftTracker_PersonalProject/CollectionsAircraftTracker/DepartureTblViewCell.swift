//
//  AirportsTblViewCell.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 5/21/25.
//

import UIKit

class DepartureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var departFlightNumberLabel: UILabel!
    @IBOutlet weak var departureTImeLabel: UILabel!
    @IBOutlet weak var arrivalCityLabel: UILabel!
    @IBOutlet weak var airlineLogoImageView: UIImageView!
    @IBOutlet weak var statusIndicatorView: UIView!
    @IBOutlet weak var flightStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
        configureViews()
    }
    
    private func setupCellAppearance() {
        // Cell background and spacing
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        backgroundColor = .clear
        
        // Add subtle shadow for depth
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowRadius = 3
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.masksToBounds = false
    }
    
    private func configureViews() {
        // Flight number styling
        departFlightNumberLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        departFlightNumberLabel.textColor = .label
        
        // Time styling
        departureTImeLabel.font = .monospacedDigitSystemFont(ofSize: 16, weight: .medium)
        departureTImeLabel.textColor = .secondaryLabel
        
        // City styling
        arrivalCityLabel.font = .systemFont(ofSize: 16, weight: .medium)
        arrivalCityLabel.textColor = .systemBlue
        
        // Airline logo styling
        airlineLogoImageView.contentMode = .scaleAspectFit
        airlineLogoImageView.layer.cornerRadius = 6
        airlineLogoImageView.clipsToBounds = true
        
        // Status indicator
        statusIndicatorView.layer.cornerRadius = 4
        statusIndicatorView.clipsToBounds = true
        
        // Status label
        flightStatusLabel.font = .systemFont(ofSize: 12, weight: .medium)
        flightStatusLabel.textColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
    }
    
    func configure(with flight: Flight) {
        departFlightNumberLabel.text = flight.number
        departureTImeLabel.text = flight.departureTime
        arrivalCityLabel.text = flight.arrivalCity
        
        // Set airline logo (you would load this from your assets or network)
        airlineLogoImageView.image = UIImage(named: flight.airlineCode.lowercased())
        
        // Configure status
        switch flight.status {
        case .onTime:
            statusIndicatorView.backgroundColor = .systemGreen
            flightStatusLabel.text = "ON TIME"
        case .delayed:
            statusIndicatorView.backgroundColor = .systemOrange
            flightStatusLabel.text = "DELAYED"
        case .cancelled:
            statusIndicatorView.backgroundColor = .systemRed
            flightStatusLabel.text = "CANCELLED"
        case .boarding:
            statusIndicatorView.backgroundColor = .systemBlue
            flightStatusLabel.text = "BOARDING"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        selectedBackgroundView = bgColorView
    }
}
