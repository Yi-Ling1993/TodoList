//
//  DetailViewController.swift
//  TodoList
//
//  Created by 劉奕伶 on 2018/8/28.
//  Copyright © 2018年 Appwork School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var itemDetail: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        detailTextView.text = itemDetail
        
        if itemDetail != nil {
            self.title = "Edit"
        } else {
            self.title = "Add"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
