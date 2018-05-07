//
//  CompoundDataSourceViewController.swift
//  DataSourcesDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import CompoundDataSources
import UIKit

class CompoundDataSourceViewController: UITableViewController {

    private var stringDataSource: StringDataSource!
    private var intDataSource: IntDataSource!
    private var compoundDataSource: CompoundDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }

        stringDataSource = StringDataSource(tableView: tableView, selectionAction: { [weak self] string in
            self?.compoundDataSource.deselectSelectedRow()
            print("Tapped: \(string)")
        }, title: "Strings")

        intDataSource = IntDataSource(tableView: tableView, selectionAction: { [weak self] integer in
            self?.compoundDataSource.deselectSelectedRow()
            self?.intDataSource.printSelected(integer: integer)
        }, title: "Ints")

        compoundDataSource = CompoundDataSource(dataSources: [
            stringDataSource,
            intDataSource,
        ], tableView: tableView)
    }
}
