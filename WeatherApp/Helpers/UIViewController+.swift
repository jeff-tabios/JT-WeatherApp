//
//  UIViewController+.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/11/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(title: String? = "", description: String?, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            completion?()
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
