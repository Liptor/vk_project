//
//  GroupsViewController.swift
//  interface_project
//
//  Created by acer on 03.11.2022.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    let groups = [
        Group(image: UIImage(systemName: "internaldrive"), name: "Dota" ),
        Group(image: UIImage(systemName: "book.closed.fill"), name: "Econimists" ),
        Group(image: UIImage(systemName: "doc.richtext.fill.th"), name: "Football" ),
        Group(image: UIImage(systemName: "calendar"), name: "Basketball" ),
        Group(image: UIImage(systemName: "archivebox"), name: "Rock" ),
    ]
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    var filteredGroup = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredGroup = groups
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupViewCell else {
            preconditionFailure("GroupCell cannot")
        }
        
        cell.labelGroup.text = filteredGroup[indexPath.row].name
        cell.imageGroup.image = filteredGroup[indexPath.row].image

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGroup = groups
        } else {
            filteredGroup = groups.filter {$0.name.contains(searchText) }
        }
        tableView.reloadData()
    }

}
