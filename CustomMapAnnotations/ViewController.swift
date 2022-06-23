//
//  ViewController.swift
//  CustomMapAnnotations
//
//  Created by Darianne Salinas on 6/22/22.
//

import UIKit
import MapKit       //added mapkit dependency to the project

/*
- added subclass MKMapViewDelegate to make VC the delegate for map view
- enables us to fully control behavior of map
*/


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //specifices VC as delegate for map view - we tell MapView that we want to control it from this class
        mapView.delegate = self
    //call two methods we created to end of viewDidLoad to view added annotations when app is started
        self.configureMap()
        self.placePins()
    }
    
    
    // MARK: - Set Region of Map View
    //before adding annotations, need to set region of map view
    //region controls where center of map is and zoom level desired for the map
    func configureMap() {
        //center specifies coordinates for what we want center of map view to be (in ex, center is Washington Sq. Arch
        let center = CLLocationCoordinate2D(latitude: 40.730824, longitude: -73.997330)
        //span is set for map view -> it's a specification determining how much of the map to include (ex. zoom level)
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        //next two lines use center coordinates and span to create a MKCoordinateregion object, then sets that as the region used by map view
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        self.placePins()
        
    }

    
    /* MARK: - Add Annotations to Map
     - add 4 annotations to the map
     - create instance of MKPointAnnotation, then give it coordinate & title, finally add annotation to mapView
     - call function placePins
     */
    func placePins() {
        //sets up coordinates of each location we want on the map
        let coords = [
            CLLocationCoordinate2D(latitude: 40.689249, longitude: -74.044500),
            CLLocationCoordinate2D(latitude: 40.781174, longitude: -73.966660),
            CLLocationCoordinate2D(latitude: 40.748817, longitude: -73.985428),
            CLLocationCoordinate2D(latitude: 40.706175, longitude: -73.996918)
        ]
        
        //sets up titles of each location we want on the map
        let titles = ["Statue of Liberty", "Central Park", "Empire State Building", "Brooklyn Bridge"]
        
        // for loop
        /*  - first thing done is create new instance of MKPointAnnotation and specifies its coordinates & title based on variables created
            - finally annotation is added to map view
         
         */
        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coords[i]
            annotation.title = titles[i]
            mapView.addAnnotation(annotation)
        }
    }
    
    
    // MARK: - Customization of Annotation Color
    
    //Changed pins to all Blue
    //change background color of pin
    // annotationView is created as new annotation view and its color is changed to blue then returned back to map view setting pins to blue
    /*
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = UIColor.blue
        return annotationView
    }
     */
    
    
    //Changed pins to each having custom color
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        switch annotation.title!! {
            case "Statue of Liberty":
            annotationView.markerTintColor = UIColor(red: 69.0/255, green: 95.0/255, blue: 170.0/255, alpha: 1.0)
            annotationView.glyphImage = UIImage(named: "liberty")
            case "Central Park":
            annotationView.markerTintColor = UIColor(red: 52.0/255, green: 114.0/255, blue: 1.0/255, alpha: 1.0)
            annotationView.glyphImage = UIImage(named: "park")
            case "Empire State Building":
            annotationView.markerTintColor = UIColor(red: 246.0/255, green: 233.0/255, blue: 212.0/255, alpha: 1.0 )
            case "Brooklyn Bridge":
            annotationView.markerTintColor = UIColor(red: 146.0/255, green: 187.0/255, blue: 217.0/255, alpha: 1.0)
            
        default:
            annotationView.markerTintColor = UIColor.blue
        }
        return annotationView
}

}
