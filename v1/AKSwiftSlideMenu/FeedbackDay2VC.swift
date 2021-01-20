//
//  FeedbackDay2VC.swift
//  AKSwiftSlideMenu
//
//  Created by Travis Zhang on 5/3/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import WebKit

class FeedbackDay2VC: BaseViewController, WKNavigationDelegate {

    @IBOutlet weak var wv: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        setupLink()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLink()
    {
        let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdpFlYa1AMQ0bkYHcGDVAYkmD1EyBF6CvFvYU3PsQAVdOO37w/viewform?usp=sf_link")
        wv?.load( URLRequest(url: url!) )
        wv.navigationDelegate = self
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator?.startAnimating()
        } else {
            activityIndicator?.removeFromSuperview()
            activityIndicator?.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation:
        WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation
        navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation:
        WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
    

}
