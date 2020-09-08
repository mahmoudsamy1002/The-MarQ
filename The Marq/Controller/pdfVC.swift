//
//  pdfVC.swift
//  The Marq
//
//  Created by user on 23.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import PDFKit

class pdfVC: UIViewController {
    
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePdfFile()
        
        
    }
    
    private func configurePdfFile() {
        
        if let path = Bundle.main.path(forResource: "pdf", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url: url) {
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .horizontal
                pdfView.document = pdfDocument
            }
        }
        
    }
    
}
