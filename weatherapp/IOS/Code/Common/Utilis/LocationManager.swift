import SwiftUI
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var city = ""
    @Published var country = ""

    override init() {
        super.init()
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Perform location setup on a background thread
        DispatchQueue.global(qos: .background).async {
            // Check if location services are enabled
            if CLLocationManager.locationServicesEnabled() {
                // Request location authorization on the main thread
                DispatchQueue.main.async {
                    self.locationManager.requestWhenInUseAuthorization()
                }
                
                // Start updating location on the main thread
                DispatchQueue.main.async {
                    self.locationManager.startUpdatingLocation()
                }
            }
        }
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    print("Reverse geocoding error: \(error.localizedDescription)")
                    return
                }

                if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        self.city = city
                    }
                    if let country = placemark.country {
                        self.country = country
                    }
                }
            }
        }
    }
}

