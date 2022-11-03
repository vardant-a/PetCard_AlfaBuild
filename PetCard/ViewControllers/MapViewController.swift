//
//  MapViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController, CLLocationManagerDelegate {
    
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
    func centerLocation() {
    }
}
