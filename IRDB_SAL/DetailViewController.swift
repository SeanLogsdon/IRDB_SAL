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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    
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
            
            configureView()
        }
        
        func configureView () {
            if let entry = detailItem {
                
              //  if let thisMediaImage = mediaImage {
                    
               // }
                
                if let thisTitleLabel = titleLabel {
                    thisTitleLabel.text = entry.name
                }
                if let thisYearLabel = yearLabel {
                    thisYearLabel.text = entry.yearStart
                }
                if let thisFormatLabel = formatLabel {
                    thisFormatLabel.text = entry.format
                }
                if let thisEpisodeLabel = episodeLabel {
                    if let episodeCount = entry.episodes {
                        thisEpisodeLabel.text = "\(episodeCount) Episodes"
                    }else {
                        thisEpisodeLabel.text = ""
                    }
                }
                if let thisStudioLabel = studioLabel {
                        thisStudioLabel.text = entry.studio
                    }
                    
                if let thisDescriptionLabel = descriptionLabel{
                    thisDescriptionLabel.text = entry.description
                }
                if let thisSummaryTextView = summaryTextView {
                    thisSummaryTextView.text = entry.summary
                }
                
                    }
                }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList" {
            
            let controller = segue.destination as! CastTableViewController
            controller.castListArray = detailItem?.starring
            
        }
    }
            }
