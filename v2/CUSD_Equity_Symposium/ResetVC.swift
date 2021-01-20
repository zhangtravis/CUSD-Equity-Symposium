//
//  ResetVC.swift
//  CUSD_Equity_Symposium
//
//  Created by Travis Zhang on 8/4/19.
//  Copyright © 2019 Travis Zhang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetVC: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.resetButton.layer.cornerRadius = 6;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func sendPasswordReset(){
        Auth.auth().sendPasswordReset(withEmail: email.text!) { error in
            if error == nil
            {
                let alertController = UIAlertController(title: "An email has been sent to reset your password", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
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
