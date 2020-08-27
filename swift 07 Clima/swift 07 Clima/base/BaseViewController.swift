//
//  BaseViewController.swift
//  swift 07 Clima
//
//  Created by Thanh Duong on 8/27/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var handlerCallback: ((_ codes: [CallbackCode]) -> Void)?
    var handlerBack: (() -> Void)?
    var callbackCode: [CallbackCode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Action
    @objc func back() {
        self.handlerBack?()
        self.handlerCallback?(self.callbackCode)
        
        self.navigationController?.popViewController(animated: true)
        if self.navigationController?.parent == nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        self.handlerBack?()
        self.handlerCallback?(self.callbackCode)
        return true
    }
    
}
