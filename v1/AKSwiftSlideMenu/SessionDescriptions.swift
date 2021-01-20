//
//  SessionDescriptions.swift
//  AKSwiftSlideMenu
//
//  Created by Travis Zhang on 4/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import SafariServices

class SessionDescriptions: BaseViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new_background")!)
        textView.delegate = self
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
        showSafariVC(for: "https://www.cusd80.com/Page/100389")
        //print(URL)
        
        return false // return true if you still want UIAlertController to pop up
    }
}
