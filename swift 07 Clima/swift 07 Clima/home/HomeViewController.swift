//
//  HomeViewController.swift
//  swift 07 Clima
//
//  Created by Thanh Duong on 8/26/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {

    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "76db35b3d33286402c445e116b0ee842"

    let locationManager = CLLocationManager()
    let weatherData = WeatherData()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func getWeatherData(url : String, params: [String : String]) {
        Alamofire.request(url, method: .get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success")
                let weatherJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
                print(weatherJSON)
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    func newCityName(city: String) {
        print("city: \(city)")
        //let params : [String : String] = ["q" : city, "appid" : APP_ID]
    
        //getWeatherData(url: WEATHER_URL, params: params)
    }
    
    func updateWeatherData(json : JSON) {
        if let temp = json["main"]["temp"].double {
            weatherData.temperature = Int(temp - 273.15)
            weatherData.city = json["name"].stringValue
            weatherData.condition = json["weather"][0]["id"].intValue
            weatherData.icon = weatherData.updateWeatherIcon(condition: weatherData.condition)
            updateUIWeather()
        } else {
            cityLabel.text = "Weather UNavailable"
        }
    }
    
    func updateUIWeather() {
        cityLabel.text = weatherData.city
        temperatureLabel.text = "\(weatherData.temperature)°C"
        weatherIcon.image = UIImage(named: weatherData.icon)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, params: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailabel"
    }
    @IBAction func changeCity(_ sender: UIButton) {
        let cityView = CityViewController()
        self.navigationController?.pushViewController(cityView, animated: true)
    }
    
    //Write the PrepareForSegue Method here
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CityViewController" {
            
            let destinationVC = segue.destination as! CityViewController
            destinationVC.delegate = self
            
        }
        
    }
}
