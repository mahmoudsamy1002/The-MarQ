//
//  InterestedVC.swift
//  The Marq
//
//  Created by user on 08.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import MessageUI

class InterestedVC: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {

        let toRecipients = ["mahmoud.samy1002@gmail.com"]
        let mc: MFMailComposeViewController? = MFMailComposeViewController()
        mc?.mailComposeDelegate = self
        mc?.setToRecipients(toRecipients)
        mc?.setSubject(nameTextField.text!)
        mc?.setMessageBody("Full Name: \(nameTextField.text!) \nEmail Address: \(emailTextField.text!) \nMobile Number: \(mobileNumberTextField.text!)", isHTML: false)
        self.present(mc ?? InterestedVC(), animated: true)
        
    }
    

}
