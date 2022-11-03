//
//  FriendsViewController.swift
//  interface_project
//
//  Created by acer on 03.11.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let friends = [
        Friend(image: UIImage.init(systemName: "paperplane.fill"), name: "Andrew"),
        Friend(image: UIImage.init(systemName: "pencil"), name: "Petr"),
        Friend(image: UIImage.init(systemName: "square.and.pencil"), name: "Olga"),
        Friend(image: UIImage.init(systemName: "trash.fill"), name: "Semen"),
        Friend(image: UIImage.init(systemName: "folder.badge.plus"), name: "Alexey")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendViewCell else {
            preconditionFailure("Friendcell cannot")
        }
        
        cell.labelFriend.text = friends[indexPath.row].name
        cell.imageFriend.image = friends[indexPath.row].image
        
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
