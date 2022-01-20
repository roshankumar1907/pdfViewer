//
//  PdfViewController.swift
//  GoogleMapExample
//
//  Created by Roshan Sinha on 20/01/22.
//

import UIKit
import PDFKit

class PdfViewController: UIViewController {

    //Mark:-
    @IBOutlet weak var pdfKitView: PDFView!
    @IBOutlet weak var pdfTitleLabel: UILabel!
    
    
    //Variables
    var pdfDocument: PDFDocument = PDFDocument()
    var totalPageCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfViewerExample()
       
    }
    
    func pdfViewerExample() {
        guard let pdfViewer = Bundle.main.url(forResource: "PdfExmapleForDemo", withExtension: "pdf")
        else {
            print("Error message of PDF")
            return
        }
        pdfDocument = PDFDocument(url: pdfViewer)!
        pdfKitView.document = pdfDocument
        pdfKitView.autoScales = true
        pdfKitView.displayMode = .singlePage
        pdfKitView.displayDirection = .horizontal
        pdfKitView.usePageViewController(true)
        totalPageCount = 0
        
        if let totalPages = pdfKitView.document?.pageCount
        {
            totalPageCount = totalPages
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(countPages), name: Notification.Name.PDFViewPageChanged, object: nil)
        countPages()
    }
    
    @objc func countPages(){
        let currentPageNumber = pdfDocument.index(for: pdfKitView.currentPage!) + 1
        let totalPages = "\(currentPageNumber)/\(totalPageCount)"
        pdfTitleLabel.text = "Pdf Viewer = \(totalPages)"
     
  }
    
}
