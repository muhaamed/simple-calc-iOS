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
    
    var history = [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : ViewController = segue.destination as! ViewController
        destViewController.historyList = history
    }

    
    override func viewDidLoad() {
        
    }
}
