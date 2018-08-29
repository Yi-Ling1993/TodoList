//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by 劉奕伶 on 2018/8/28.
//  Copyright © 2018年 Appwork School. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var item = ["aaa", "bbb", "ccc"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibs = UINib(nibName: "TodoListTableViewCell", bundle: nil)
        tableView.register(nibs, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
    }
    
    @objc func getUpdateNoti(noti: Notification) {
        
        let data = noti.userInfo?["PASS"]
        
        item.append(data as! String)
        
        navigationController?.popViewController(animated: true)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as? TodoListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.todoLabel.text = item[indexPath.row]
        cell.editButton.tag = indexPath.row
        
        cell.editButton.addTarget(self, action: #selector(TodoListTableViewController.goEdit(sender:)), for: .touchUpInside)
        
        return cell

    }
    
    @objc func goEdit(sender: UIButton) {
        self.performSegue(withIdentifier: "editPage", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tag = sender as? Int else {return}
        let detailController = segue.destination as! DetailViewController
        detailController.itemDetail = item[tag]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
