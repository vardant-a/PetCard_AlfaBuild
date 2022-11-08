//
//  MapViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    // MARK: - Private properties
    // SeachController
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search animal"
        search.searchBar.tintColor = .systemBlue
        return search
    }()
    
    // MapKit
    private lazy var mapKitView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    private let locationManager = CLLocationManager()
    
    private let lostPets = LostAnimal.shared.lostAnimals
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        view.addSubview(mapKitView)
        
        mapKitView.delegate = self
        mapKitView.addAnnotations(lostPets)
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cheakLocationEnabled()
    }
}

// MARK: - Setting for NavigationBar
extension MapViewController {
    private func setNavBar() {
        title = "Animal Map"
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
    }
}

// MARK: - Setting Constrains
extension MapViewController {
    private func setConstraints() {
        mapKitView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapKitView.topAnchor.constraint(equalTo: view.topAnchor),
            mapKitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapKitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapKitView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MapViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
    }
}

extension MapViewController {
    private func cheakLocationEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.setupManager()
                self.cheakAuthorization()
            } else {
                self.showAlertLocation(
                    title: "Your location service is disabled",
                    message: "Please open settings and allow PetCard to use your location.",
                    url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
            }
        }
    }
    
    private func cheakAuthorization() {
        let authorizationStatus: CLAuthorizationStatus

        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }

        switch authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapKitView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertLocation(
                title: "Access to geolocation is prohibited",
                message: "Please open settings and allow PetCard to use your location.",
                url: URL(string: UIApplication.openSettingsURLString)
            )
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            print("case default")
        }
    }

}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 2000, longitudinalMeters: 2000)
            mapKitView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        cheakAuthorization()
    }
    
    private func setupManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
}

// MARK: - Alert for segue in settings
extension MapViewController {
    private func showAlertLocation(title: String, message: String?, url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title:"Candel", style: .cancel, handler: nil)
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard let annotation = annotation as? AnimalPlace else { return nil }
//        var viewMarker: MKMarkerAnnotationView
//        let idView = "marker"
//        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: idView) as? MKMarkerAnnotationView {
//            view.annotation = annotation
//            viewMarker = view
//        } else {
//            viewMarker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idView)
//            viewMarker.canShowCallout = true
//            viewMarker.calloutOffset = CGPoint(x: 0, y: 1.5)
//            let detailMarkerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
//            detailMarkerView.backgroundColor = .green
//            viewMarker.leftCalloutAccessoryView = detailMarkerView
////            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return viewMarker
//    }
}
