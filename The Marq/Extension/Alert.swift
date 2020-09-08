//
//  Alert.swift
//  The Marq
//
//  Created by user on 05.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//
import UIKit


extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
