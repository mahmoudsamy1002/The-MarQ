//
//  AboutUsVC.swift
//  The Marq
//
//  Created by user on 07.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import SafariServices


class AboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
    }
    
    @IBAction func webPageBtnTapped(_ sender: UIButton) {
        let safariVC = SFSafariViewController(url: URL(string: "http://themarq.com.eg/about_us")!)
        
        present(safariVC, animated: true)
    }
    

    
}
