//
//  HomeVC.swift
//  CUSD_Equity_Symposium
//
//  Created by Travis Zhang on 7/9/19.
//  Copyright © 2019 Travis Zhang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        self.navigationItem.title = "Overview"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func greeting()
    {
        ref = Database.database().reference()
        ref?.child("Students").child(id).child("First Name").observeSingleEvent(of: .value, with: {snapshot in
            if let unwrapped = snapshot.value as? String
            {
                self.welcome.text = "Hello " + unwrapped + "!";
            }
        })
    }*/
}

var currentIndexPath = 0
var path = ""
class KeynoteSpeakersVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        databaseHandle = ref?.child("").observe(.childAdded, with: {(snapshot) in
            self.postData.append(snapshot.key)
            
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        currentIndexPath = indexPath.row
        path = postData[currentIndexPath]
        performSegue(withIdentifier: "Info", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InformationVC{
            destination.navigationBar.title = postData[currentIndexPath]
        }
    }
}

var websiteLink = String()
class InformationVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var activity: UITextView!
    @IBOutlet weak var dateTime: UITextView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var website: UITextView!
    @IBOutlet weak var contact: UITextView!
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activity.layer.borderWidth = 1;
        self.activity.layer.cornerRadius = 6;
        self.dateTime.layer.borderWidth = 1;
        self.dateTime.layer.cornerRadius = 6;
        self.website.layer.borderWidth = 1;
        self.website.layer.cornerRadius = 6;
        self.location.layer.borderWidth = 1;
        self.location.layer.cornerRadius = 6;
        self.contact.layer.borderWidth = 1;
        self.contact.layer.cornerRadius = 6;
        
        self.website.delegate = self
        
        retrieveInfo()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveInfo()
    {
        ref = Database.database().reference()
        ref?.child("").child(path).child("").observe(.value, with: {(snapshot) in
            if let unwrapped = snapshot.value as? String
            {
                self.activity.text = String(unwrapped)
            }
        })
        ref?.child("").child(path).child("").observe(.value, with: {(snapshot) in
            if let unwrapped = snapshot.value as? String
            {
                self.contact.text = String(unwrapped)
            }
        })
        ref?.child("").child(path).child("").observe(.value, with: {(snapshot) in
            if let unwrapped = snapshot.value as? String
            {
                self.dateTime.text = String(unwrapped)
            }
        })
        ref?.child("").child(path).child("").observe(.value, with: {(snapshot) in
            if let unwrapped = snapshot.value as? String
            {
                self.location.text = String(unwrapped)
            }
        })
        ref?.child("").child(path).child("").observe(.value, with: {(snapshot) in
            if let unwrapped = snapshot.value as? String
            {
                self.website.text = String(unwrapped)
                websiteLink = String(unwrapped)
            }
        })
    }
}
