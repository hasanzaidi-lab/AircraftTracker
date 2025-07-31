//        let aviationStackAPIKey = Secrets.aviationStackAPIKey
//        let url = URL(string: "https://api.aviationstack.com/v1/airports?access_key=\(aviationStackAPIKey)")!
//        let request = URLRequest(url: url)
//        let network = NetworkLayer()
//
//        Task {
//            do {
//                let dataModel: AircraftStatusDataModel = try await network.doApiCall(urlRequest: request)
//
//                for status in dataModel.data {
//                    if status.flight_status != "scheduled" {
//                        print("Airline: \(status.airline?.name ?? "N/A")")
//                        print("Aircraft: \(status.aircraft?.registration ?? "N/A")")
//                        print("Status: \(status.flight_status)")
//
//                        if let live = status.live {
//                            print("Live Position: lat \(live.latitude ?? 0), long \(live.longitude ?? 0)")
//                        } else {
//                            print("Live Position: N/A")
//                        }
//                        print(status.flight?.iata ?? "")
//                        print("----------")
//                    }
//                }
//
//            }
//        }
        
        
//        let url = URL(string: "https://opensky-network.org/api/states/all")!
//        let request = URLRequest(url: url)
//        let network = NetworkLayer()
        
//        Task {
//            do {
//                let dataModel: OpenSkyDataModel = try await network.doApiCall(urlRequest: request)
//
//                // Print number of states and a few samples
//                print("Fetched time: \(dataModel.time)")
//                print("Total states: \(dataModel.states.count)")
//
//                for state in dataModel.states.prefix(5) {
//                    print("Callsign: \(state.callsign), Country: \(state.originCountry), Lat: \(state.latitude ?? 0), Lon: \(state.longitude ?? 0), Alt: \(state.geoAltitude ?? 0), Velocity: \(state.velocity), ICAO: \(state.icao24)")
//                }
//
//            } catch {
//                print("Error fetching data: \(error)")
//            }
//        }

//
//        let url = URL(string: "https://aerodatabox.p.rapidapi.com/flights/airports/iata/DXB")!
//        var request = URLRequest(url: url)
//
//        let api_key = Secrets.rapidAPIKey
//        let host = Secrets.rapidAPIHost
//        // Add headers for RapidAPI
//        request.addValue(host, forHTTPHeaderField: "x-rapidapi-host")
//        request.addValue(api_key, forHTTPHeaderField: "x-rapidapi-key")
//
//        let network = NetworkLayer()
//
//        Task {
//            do {
//                let flightData: FlightDataModel = try await network.doApiCall(urlRequest: request)
//
//                if let arrivals = flightData.arrivals {
//                    for flight in arrivals {
//                        if let _flight = flight as? Flight {
//                            let _flMovement = flight.movement.airport?.name ?? ""
//                            let _flCallSign = flight.airline.name ?? ""
//                            let _flNumber = flight.number
//                            print("\n---------------- \n Flight: \(_flNumber) \n Airline: \(_flCallSign) \n From: \(_flMovement) \n Aircraft: \(flight.aircraft?.model ?? "") \n----------------")
//                        }
//                    }
//                } else {
//                    print("No arrivals data found.")
//                }
//
//            } catch let NetworkError.decodingFailed(error) {
//                print("❌ Decoding error details: \(error)")
//            } catch {
//                print("❗️Other error: \(error)")
//            }
//
//        }
//
//
//        let aviationStackAPIKey = Secrets.aviationStackAPIKey
//        let urlAirport = URL(string: "https://api.aviationstack.com/v1/airports?access_key=\(aviationStackAPIKey)")!
//        var airportURLRequest = URLRequest(url: urlAirport)
//
//        // Add headers for RapidAPI
//        airportURLRequest.addValue(host, forHTTPHeaderField: "x-rapidapi-host")
//        airportURLRequest.addValue(api_key, forHTTPHeaderField: "x-rapidapi-key")
//
//        Task {
//            do {
//                let airportData: AirportModel = try await network.doApiCall(urlRequest: airportURLRequest)
//
//                print("Airport Name: \(airportData.airportName ?? "")")
//                print("City: \(airportData.cityIataCode ?? "")")
//                print("Country: \(airportData.countryName ?? "")")
//                print("ICAO: \(airportData.icaoCode ?? "")")
//                print("IATA: \(airportData.iataCode ?? "")")
//
//            } catch {
//                print("Error fetching airport data: \(error)")
//            }
//        }


// MARK: - Second API Call: AviationStack Airport Info API

//    func fetchAirportInfo() {
//        let apiKey = Secrets.aviationStackAPIKey
//        guard let url = URL(string: "https://api.aviationstack.com/v1/airports?access_key=\(apiKey)") else { return }
//        var airportURLRequest = URLRequest(url: url)
//
//        airportURLRequest.addValue(Secrets.rapidAPIHost, forHTTPHeaderField: "x-rapidapi-host")
//        airportURLRequest.addValue(Secrets.rapidAPIKey, forHTTPHeaderField: "x-rapidapi-key")
//
//        Task {
//            do {
//                let airportData: AirportModel = try await network.doApiCall(urlRequest: airportURLRequest)
//                let airports = airportData.data
//                for airport in airports {
//                    print("""
//                    ✈️ Airport Info:
//                    Name: \(airport.airport_name ?? "Unknown")
//                    City: \(airport.city_iata_code ?? "Unknown")
//                    Country: \(airport.country_name ?? "Unknown")
//                    ICAO: \(airport.icao_code ?? "Unknown")
//                    IATA: \(airport.iata_code ?? "Unknown")
//                    """)
//                }
//            } catch {
//                print("Error fetching airport data: \(error)")
//            }
//
//        }
//    }
