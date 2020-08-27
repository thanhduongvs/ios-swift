//
//  CityViewController.swift
//  swift 07 Clima
//
//  Created by Thanh Duong on 8/26/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func newCityName(city: String)
}

class CityViewController: UIViewController {

    var delegate : ChangeCityDelegate?
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.title = "Change city"
        // Do any additional setup after loading the view.
    }

    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let cityName = changeCityTextField.text!
        print("\(cityName)")
        delegate?.newCityName(city: cityName)
        back()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent{
            print("=== back ===")
        }
    }
    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        back()
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
        if self.navigationController?.parent == nil {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
