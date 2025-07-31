//
//  ArrivalTableViewCell.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 6/4/25.
//

import UIKit

class ArrivalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var arriveFlightNumber: UILabel!
    @IBOutlet weak var departedCityLabel: UILabel!
    @IBOutlet weak var arrivalTimeLable: UILabel!
    @IBOutlet weak var airlineLogoImageView: UIImageView!
    @IBOutlet weak var statusIndicatorView: UIView!
    @IBOutlet weak var flightStatusLabel: UILabel!
    @IBOutlet weak var baggageClaimLabel: UILabel!
    
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
        arriveFlightNumber.font = .systemFont(ofSize: 18, weight: .semibold)
        arriveFlightNumber.textColor = .label
        arriveFlightNumber.numberOfLines = 1
        arriveFlightNumber.adjustsFontSizeToFitWidth = true
        arriveFlightNumber.minimumScaleFactor = 0.8
        arriveFlightNumber.lineBreakMode = .byTruncatingTail
        
        // City styling
        departedCityLabel.font = .systemFont(ofSize: 16, weight: .medium)
        departedCityLabel.textColor = .systemBlue
        
        // Time styling
        arrivalTimeLable.font = .monospacedDigitSystemFont(ofSize: 16, weight: .medium)
        arrivalTimeLable.textColor = .secondaryLabel
        
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
        
        // Baggage claim
        baggageClaimLabel.font = .systemFont(ofSize: 12, weight: .medium)
        baggageClaimLabel.textColor = .systemGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
    }
    
    func configure(with flight: Flight) {
        arriveFlightNumber.text = flight.number
        departedCityLabel.text = flight.departureCity
        arrivalTimeLable.text = flight.arrivalTime
        
        // Set airline logo
        airlineLogoImageView.image = UIImage(named: flight.airlineCode.lowercased())
        
        // Configure status
        switch flight.status {
        case .landed:
            statusIndicatorView.backgroundColor = .systemGreen
            flightStatusLabel.text = "LANDED"
        case .delayed:
            statusIndicatorView.backgroundColor = .systemOrange
            flightStatusLabel.text = "DELAYED"
        case .diverted:
            statusIndicatorView.backgroundColor = .systemPurple
            flightStatusLabel.text = "DIVERTED"
        case .inAir:
            statusIndicatorView.backgroundColor = .systemBlue
            flightStatusLabel.text = "IN AIR"
        }
        
        // Baggage claim info
        baggageClaimLabel.text = flight.baggageClaim != nil ? "Baggage: \(flight.baggageClaim!)" : nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        selectedBackgroundView = bgColorView
    }
}
