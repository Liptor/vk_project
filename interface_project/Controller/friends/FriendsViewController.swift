//
//  FriendsViewController.swift
//  interface_project
//
//  Created by acer on 03.11.2022.
//

import UIKit

class FriendsViewController: UITableViewController {

    let friends = [
        Friend(image: UIImage(named: "avatar.jpg"), name: "Andrew"),
        Friend(image: UIImage(named: "avatar.jpg"), name: "Petr"),
        Friend(image: UIImage(named: "avatar.jpg"), name: "Olga"),
        Friend(image: UIImage(named: "avatar.jpg"), name: "Semen"),
        Friend(image: UIImage(named: "avatar.jpg"), name: "Alexey")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendXibTableCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendXibTableCell", for: indexPath) as? FriendTableViewCell else {
            preconditionFailure("Friendcell cannot")
        }
        
        cell.friendLabel.text = friends[indexPath.row].name
        cell.fiendImage.image = friends[indexPath.row].image
        cell.fiendImage.setRounded()
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OneFriendImage", let destinationVC = segue.destination as? OneFriendViewCell, let indexPath = tableView.indexPathForSelectedRow  {
            let friends = friends[indexPath.row].image
            destinationVC.oneFriendImage = friends
        }
    }

}
