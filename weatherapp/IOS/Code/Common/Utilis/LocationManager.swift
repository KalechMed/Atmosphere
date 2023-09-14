import SwiftUI
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var city = ""
    @Published var country = ""
    @Published var isLocationPermissionGranted = false
    @Published var locationPermissionDidChange = PassthroughSubject<Bool, Never>()

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
    

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            // Check location authorization status
            let status = CLLocationManager.authorizationStatus()
            isLocationPermissionGranted = (status == .authorizedWhenInUse || status == .authorizedAlways)
            locationPermissionDidChange.send(isLocationPermissionGranted)
        }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            isLocationPermissionGranted = true
        default:
            isLocationPermissionGranted = false
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

