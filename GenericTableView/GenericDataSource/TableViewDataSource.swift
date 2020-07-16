//
//  TableViewDataSource.swift
//  GenericTableView
//
//  Created by Ajeet N on 16/07/20.
//  Copyright © 2020 Ajeet N. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell:UITableViewCell,ViewModel>: NSObject,UITableViewDataSource {
    let cellIdentifier: String
    var items: [ViewModel]
    let configureCell: (Cell,ViewModel)->Void
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping(Cell,ViewModel)->Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? Cell else {
            fatalError("Cell with identifier \(self.cellIdentifier) not found")
        }
        
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        return cell
    }
}
