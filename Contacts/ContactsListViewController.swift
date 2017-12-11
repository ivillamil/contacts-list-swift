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
    
    var contacts: Array<Contact>! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        fetchContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Custom Functions
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
                    self.tableView.reloadData()
                }
                
            } else {
                print(error!)
            }
        }
        requestTask.resume()
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
        let imageURL = URL(string: contact.avatar)
        let imageData = try? Data(contentsOf: imageURL!)
        let image = UIImage(data: imageData!)
        
        cell.nameLabel.text = contact.name
        cell.descriptionLabel.text = contact.title
        cell.avatarImageView.image = image
        
        return cell
    }
}
