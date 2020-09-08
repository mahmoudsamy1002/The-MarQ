//
//  Validation.swift
//  The Marq
//
//  Created by user on 05.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    
    // validate an email for the right format
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
}

