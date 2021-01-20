//
//  HomeVC.swift
//  AKSwiftSlideMenu
//
//  Created by MAC-186 on 4/8/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {
    
    @IBOutlet weak var contentView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        setupContent()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func setupContent()
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let bullet = "\t•  "
        var strings = [String]()
        strings.append("Culturally relevant pedagogy")
        strings.append("Suicide awareness and prevention")
        strings.append("Adverse Childhood Experiences (ACEs)")
        strings.append("Implicit and unconscious bias")
        strings.append("Collaboration between schools and communities")
        strings.append("A host of socio-emotional-learning and instructional strategies")
        strings = strings.map { return bullet + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.systemFont(ofSize:17)
        
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle1
        
        let string = strings.joined(separator: "\n\n")
        
        let attributedText = NSMutableAttributedString(string: "Welcome!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30), NSAttributedString.Key.paragraphStyle: paragraphStyle])
        attributedText.append(NSAttributedString(string: "\n\nThis two-day event seeks to build the capacity of faculty and staff. Members of the CUSD community will explore:\n\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]))
        attributedText.append(NSAttributedString(string: string, attributes: attributes))
        attributedText.append(NSAttributedString(string:"\n\nThe professional development will allow faculty and staff to be immersed in learning with the goal of transforming CUSD in meeting our Journey 2025 strategic plan. The two-day symposium invites thought leaders (national and local) and CUSD faculty to create a space for \"courageous conversations\". The space will allow educators to build a deeper understanding of our diverse learning community, explore best practices in meeting the varied learning needs of our students and fulfill the promise to our parents.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]))
        
        contentView.attributedText = attributedText
        //contentView.textColor = UIColor.white
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

}
