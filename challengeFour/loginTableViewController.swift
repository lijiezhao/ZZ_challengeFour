//
//  loginTableViewController.swift
//  challengeFour
//
//  Created by Lijie Zhao on 8/23/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import UIKit

class loginTableViewController: UITableViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var LoggedIn: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        login(userText: usernameField.text!, passText: passwordField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let userDefaults = UserDefaults.standard
        if userDefaults.string(forKey: "user-auth-token") == nil {
            print("FIRST LAUNCH")
            LoggedIn.text = "YOU ARE NOT LOGGED IN! LOG IN PLEASE!"
        }else{
            print(userDefaults.string(forKey: "user-auth-token")!)
            print("NOT FIRST LAUNCH")
            LoggedIn.text = "YOU ARE LOGGED IN! TAP SKIP LOG IN!"
        }        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "skipVC" {
            let controller = segue.destination as! LoggedinViewController
            if LoggedIn.text == "YOU ARE NOT LOGGED IN! LOG IN PLEASE!" {
                controller.statusText = false
            }else{
                controller.statusText = true
            }
        }
        
        if segue.identifier == "LoginVC" {
            let controller = segue.destination as! LoggedinViewController
            
            controller.statusText = true
        }
    }
    

}
