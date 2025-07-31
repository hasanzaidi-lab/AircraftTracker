
---

## ✈️ Aircraft Tracker App – Project Plan

### 📱 **App Summary**

Track flights by:

* Airport
* Flight number
* Tail number

Display relevant details such as:

* Aircraft model
* Departure/Arrival time
* Status
* Airport information

---

## ✅ Step-by-Step Project Plan

### 1. **Project Setup**

* [ ] Create a new Xcode SwiftUI project.
* [ ] Organize folders: `Models`, `ViewModels`, `Views`, `Networking`, `Utilities`.

---

### 2. **Define Data Models**

Example models based on sample JSON:

* [ ] `Flight`: ID, flight number, tail number, status, departure/arrival info.
* [ ] `Airport`: Code, name, city, country.
* [ ] `Aircraft`: Model, registration, airline.

```swift
struct Flight: Identifiable, Decodable {
    let id: String
    let flightNumber: String
    let tailNumber: String
    let status: String
    let departure: Airport
    let arrival: Airport
}
```

---

### 3. **Build Networking Layer**

* [ ] Create a `NetworkManager` using `async/await`.
* [ ] Handle different endpoints (e.g., search by flight number, tail number, or airport).
* [ ] Decode JSON into models.

---

### 4. **Design UI with SwiftUI**

* [ ] **Home View**: Search bar + segmented control (Flight #, Tail #, Airport).
* [ ] **Results View**: List of matched flights.
* [ ] **Flight Detail View**: Aircraft + departure/arrival + status info.
* [ ] **ErrorView** or loading indicators.

---

### 5. **Implement ViewModels (MVVM)**

Each screen has a corresponding ViewModel:

* [ ] `SearchViewModel`: Manages user input and triggers fetch.
* [ ] `FlightListViewModel`: Holds list of flights.
* [ ] `FlightDetailViewModel`: Handles selected flight details.

Use Combine (`@Published`) or Swift Concurrency (`@MainActor` + `async/await`) to update UI.

---

### 6. **Error Handling & Edge Cases**

* [ ] Handle empty results
* [ ] Handle network errors
* [ ] Graceful fallback UI for invalid input

---

### 7. **Testing**

* [ ] Unit tests for ViewModels
* [ ] Use mock data
* [ ] Snapshot tests (optional)

---

### 8. **Extra Features (Optional)**

* [ ] Show map with aircraft position (MapKit)
* [ ] Save favorite flights or airports (Core Data)
* [ ] Real-time updates using Combine timers or WebSockets (if supported)

---

## 🔧 Tools & Frameworks Used

| Layer      | Tool/Framework           |
| ---------- | ------------------------ |
| UI         | SwiftUI                  |
| Logic      | MVVM                     |
| Networking | URLSession + async/await |
| State Mgmt | Combine / `@Published`   |
| Testing    | XCTest, Mocking          |
| Optional   | MapKit, CoreData         |

---

