//
//  TermsVC.swift
//  AKSwiftSlideMenu
//
//  Created by Travis Zhang on 4/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TermsVC: BaseViewController {

    @IBOutlet weak var contentView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new_background")!)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.setContentOffset(CGPoint.zero, animated: false)
    }
}
