//
//  ContactsListViewController.swift
//  Contacts
//
//  Created by Iván Villamil Covián on 12/10/17.
//  Copyright © 2017 Iván Villamil Covián. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: Array<Contact> = [Contact]()
    var selectedIndex: Int!
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        indicatorView()
        showIndicator()
        fetchContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let contact: Contact = contacts[selectedIndex]
            guard let detailsController = segue.destination as? ContactDetailsViewController else { return }
            detailsController.currentContact = contact
        }
    }
    
    func fetchContacts() {
        let url = URL(string: "https://gist.githubusercontent.com/ivillamil/e10ca31afcd136a5a7c7/raw/240a27e8c34b5bec7edfa19ee42efad909a85401/demo-users-db.json")
        let request = URLRequest(url: url!)
        let requestTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                let json = try? JSONSerialization.jsonObject(with: data!)
                if let dictionary = json as? [String: Any] {
                    if let users = dictionary["users"] as? NSArray {
                        for user in users {
                            let contact = try? Contact(json: (user as! [String: Any]))
                            if contact != nil {
                                self.contacts.append(contact!)
                            }
                        }
                    }
                }
                
                DispatchQueue.main.sync {
                    self.hideIndicator()
                    self.tableView.reloadData()
                }
                
            } else {
                print(error!)
            }
        }
        requestTask.resume()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func indicatorView() {
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
}

extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        let contact = contacts[indexPath.row]
        
        cell.nameLabel.text = contact.name
        cell.descriptionLabel.text = contact.title
        cell.avatarImageView.image = contact.avatarImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
}
