//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Muhaamed Drammeh on 4/21/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "Sa wagi"
        return cell
    }
    @IBOutlet weak var label: UILabel!
    var labelText = String()
    override func viewDidLoad() {
        label.text = labelText
    }
}
