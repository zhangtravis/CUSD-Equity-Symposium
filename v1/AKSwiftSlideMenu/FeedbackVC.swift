//
//  FeedbackVC.swift
//  AKSwiftSlideMenu
//
//  Created by Travis Zhang on 4/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import SafariServices

class FeedbackVC: BaseViewController, UITextViewDelegate{
    
    @IBOutlet weak var overallDay1: UITextView!
    @IBOutlet weak var specificDay1: UITextView!
    @IBOutlet weak var overallDay2: UITextView!
    @IBOutlet weak var specificDay2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        overallDay1.delegate = self
        specificDay1.delegate = self
        overallDay2.delegate = self
        specificDay2.delegate = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new_background")!)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSafariVC(for url: String)
    {
        guard let url = URL(string: url)
            else
        {
            //Show an invalid URL error alert
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if(textView == overallDay1)
        {
            showSafariVC(for: "https://docs.google.com/forms/d/e/1FAIpQLSfFV7S1Bta6YrhTIcPT82BmxPZS0a_67KOAkohWFSLh515gVA/viewform?vc=0&c=0&w=1")
        }
        if(textView == specificDay1)
        {
            showSafariVC(for: "https://docs.google.com/forms/d/e/1FAIpQLSeoxOXuTju13ju7q1lt9tOw_qhx2uTznOGbRaVQzNDz9EsEwg/viewform?usp=sf_link")
        }
        if(textView == overallDay2)
        {
            showSafariVC(for: "https://docs.google.com/forms/d/e/1FAIpQLSc1I5bIjzDRfvA6sDbxEY6Hz9RoN3PGanNV7EzWJHG_8ab5Rw/viewform")
        }
        if(textView == specificDay2)
        {
            showSafariVC(for: "https://docs.google.com/forms/d/e/1FAIpQLSdpFlYa1AMQ0bkYHcGDVAYkmD1EyBF6CvFvYU3PsQAVdOO37w/viewform?usp=sf_link")
        }
        
        return false // return true if you still want UIAlertController to pop up
    }
}


