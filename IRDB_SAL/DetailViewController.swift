//
//  ViewController.swift
//  IRDB_SAL
//
//  Created by Sean Logsdon on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var mediaImage: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var yearLabel: UILabel?
    @IBOutlet var formatLabel: UILabel?
    @IBOutlet var episodeLabel: UILabel?
    @IBOutlet var studioLabel: UILabel?
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    var detailItem: Entry? {
        didSet {
            // Update the view.
            configureView()
            }
        }
        
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            // 1
            let nav = self.navigationController?.navigationBar
          
            // 2
            nav?.barStyle = UIBarStyle.black
            nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
            
            title = detailItem?.name
        }
        
        func configureView () {
            titleLabel?.text = detailItem?.name
            yearLabel?.text = detailItem?.yearStart
            formatLabel?.text = detailItem?.format
          //  episodeLabel?.int = detailItem?.episodes
            studioLabel?.text = detailItem?.studio
    }

}
