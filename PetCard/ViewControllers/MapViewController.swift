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
    
    private var conditionNotification = true
    
    // MARK: - Private properties
    
    private let locationManager = CLLocationManager()
    private let lostPets = LostAnimal.shared.lostAnimals
    
    // MARK: - MapKit
    
    private lazy var mapKitView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    // MARK: - User Location Button
    
    private lazy var userLocationButton: UIButton = {
        let button = UIButton()
        if conditionNotification {
            button.setBackgroundImage(UIImage(systemName: "location.north.circle.fill"), for: .normal)
            button.tintColor = UIColor.systemBlue
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(setUserLocationStatus), for: .touchUpInside)
            button.layer.cornerRadius = 25
        } else {
            button.setBackgroundImage(UIImage(systemName: "location.north.circle.fill"), for: .normal)
            button.tintColor = UIColor.systemBlue
            button.backgroundColor = .black
            button.addTarget(self, action: #selector(setUserLocationStatus), for: .touchUpInside)
            button.layer.cornerRadius = 25
        }
        return button
    }()

    // MARK: - SheetPresentationController
    
    private lazy var testTable: UIViewController = {
        let table = HomeViewController()
        if #available(iOS 15.0, *) {
            if let shett = table.sheetPresentationController {
                shett.detents = [.medium()]
            }
            present(table, animated: true)
        } else {
            // Fallback on earlier versions
        }
        return table
    }()
    

    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        view.addSubview(mapKitView)
        view.addSubview(userLocationButton)
        setConstraints()
        
        mapKitView.delegate = self
        mapKitView.addAnnotations(lostPets)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cheakLocationEnabled()
    }
}

    // MARK: - Setting for NavigationBar

extension MapViewController {
    private func setNavBar() {
        title = "Map"
    }
}

    // MARK: - @Objc methods for buttons
extension MapViewController {
    @objc func setUserLocationStatus() {
        print("Tup on button")
    }
}

    // MARK: - Setting Constrains

extension MapViewController {
    private func setConstraints() {
        // MapKitView
        mapKitView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapKitView.topAnchor.constraint(equalTo: view.topAnchor),
            mapKitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapKitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapKitView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
         // button
        userLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocationButton.heightAnchor.constraint(equalToConstant: 50),
            userLocationButton.widthAnchor.constraint(equalToConstant: 50),
            userLocationButton.bottomAnchor.constraint(equalTo: mapKitView.bottomAnchor, constant: -100),
            userLocationButton.trailingAnchor.constraint(equalTo: mapKitView.trailingAnchor, constant: -16),
        ])
    }
}
    // MARK: - Всё для работы карты внизу
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
