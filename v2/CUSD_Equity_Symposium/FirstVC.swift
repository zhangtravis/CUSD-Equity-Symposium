//
//  ViewController.swift
//  CUSD_Equity_Symposium
//
//  Created by Travis Zhang on 7/8/19.
//  Copyright © 2019 Travis Zhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirstVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 4;
        self.email.delegate = self
        self.password.delegate = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new_background.png")!)
        //visibleEyeSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            textField.resignFirstResponder()
            password.becomeFirstResponder()
        } else if textField == password {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func visibleEyeSetup()
    {
        let image = UIImageView(image: UIImage(named: "eye"))
        let rightButton = UIButton(type: .custom)
        image.contentMode = UIView.ContentMode.center
        if let size = image.image?.size {
            image.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 10.0, height: size.height)
        }
        rightButton.setImage(image.image, for: .normal)
        password.rightViewMode = .always
        password.rightView = rightButton
    }
    
    @IBAction func loginAction(_ sender: Any)
    {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!)
        {(user, error) in
            
            if error == nil
            {
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            else
            {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

class SegueFromRight: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                       completion: { finished in
                        src.present(dst, animated: false, completion: nil)
        }
        )
    }
}

