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
    
    private var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search animal"
        search.searchBar.tintColor = .systemBlue
        return search
    }()
    
    private var mapKitView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    private let locationManager = CLLocationManager()
    
    private let lostPets: [AnimalPlace] = [
        AnimalPlace(
            animalName: "Ray",
            numberMaster: "+7-904",
            coordinate: CLLocationCoordinate2D(
                latitude: 55.729957,
                longitude: 37.418530)
        ),
        AnimalPlace(
            animalName: "Box",
            numberMaster: "+7-999",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.418530,
                longitude: 55.729957)
        ),
        AnimalPlace(
            animalName: "Mysia",
            numberMaster: "+7-961",
            coordinate: CLLocationCoordinate2D(
                latitude: 33.729957,
                longitude: 37.418530)
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        view.addSubview(mapKitView)
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
        if CLLocationManager.locationServicesEnabled() {
            setupManager()
            cheakAuthorization()
        } else {
            showAlertLocation(
                title: "Your location service is disabled",
                message: "Please open settings and allow PetCard to use your location.",
                url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
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
                // URL = "App-Prefs:root=LOCATION_SERVICES"
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title:"Candel", style: .cancel, handler: nil)
        
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
