//
//  MapaLugaresVC.swift
//  Pulio
//
//  Created by Diego Perez on 5/15/19.
//  Copyright © 2019 DiegoCodes. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapaLugaresVC: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    let gps = CLLocationManager()
    
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //configurarMapa()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func configurarMapa() {
        mapa.delegate = self
        gps.delegate = self
        gps.desiredAccuracy = kCLLocationAccuracyBest
        gps.requestWhenInUseAuthorization()
        
        let centro = CLLocationCoordinate2DMake(19.5953, -99.2276)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: centro,span: span)
        mapa.region = region
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization
        status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            // Hay permiso, iniciar las actualizaciones
            gps.startUpdatingLocation()
        } else if status == .denied {
            gps.stopUpdatingLocation()
            print("Puedes habilitar el gps en Ajustes") // Alerta
        }
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Cambió la posición
        mapa.setCenter(userLocation.coordinate, animated: true)
    }
    

    
    /*// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
