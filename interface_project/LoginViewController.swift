//
//  LoginViewController.swift
//  interface_project
//
//  Created by acer on 13.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginField.text
        let password = passwordField.text
        
        if (login == "admin" && password == "12345") {
            return true
        } else {
            let alert = UIAlertController(title: "Error", message: "Not correct user data", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            return false
        }
    }



    /*name
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
