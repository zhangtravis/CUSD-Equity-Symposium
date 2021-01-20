//
//  StuffVC.swift
//  AKSwiftSlideMenu
//
//  Created by Travis Zhang on 4/16/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import SafariServices

class KeynoteSpeakersVC: BaseViewController, UITextViewDelegate
{
    
    @IBOutlet weak var textView: UITextView!
    let keynoteSpeakers = [("Laravel"),("Swift"),("Apple"),("Window"),("Android")]
    let keynoteSpeakersImages = ["Catagno", "Stanton", "Howard", "De_La_Cruz"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new_background")!)
        addSlideMenuButton()
        textView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return false
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
        showSafariVC(for: "https://www.cusd80.com/Page/100274")
        //print(URL)
        
        return false // return true if you still want UIAlertController to pop up
    }
}
