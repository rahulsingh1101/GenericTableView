//
//  TabOneViewController.swift
//  GenericTableView
//
//  Created by Ajeet N on 16/07/20.
//  Copyright © 2020 Ajeet N. All rights reserved.
//

import UIKit

class TabOneViewController: UIViewController {
    @IBOutlet var tableViewObj: UITableView!
    var dataSource: TableViewDataSource<UITableViewCell,String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = TableViewDataSource(cellIdentifier: "cell", items: ["Ram","Shayam","Sita","Geeta","Reeta","Reetika","Ramesh","Suresh","Dev","Mahadev"]) { (cell, str) in
            print("\(str)")
            cell.textLabel?.text = str
        }
        tableViewObj.dataSource = dataSource
    }
}
