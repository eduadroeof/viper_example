//
//  ListView.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/17/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

class ListView : UIViewController {
    var presenter: ListPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!

    private var toDoList: [String]?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        
        presenter?.updateView()
    }
    
    // MARK: IBAction
    
    @IBAction func tapAddBarButton() {
        presenter?.didTapAddBarButton()
    }
    
    // MARK: Private
    
    private func setupNavigationBar() {
        title = "To Do List"
        
        let button = initAddBarButton()
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }
    
    private func initAddBarButton() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Add", style: .Plain, target: self, action: Selector("tapAddBarButton"))
    }
}

// MARK: ListViewProtocol

extension ListView : ListViewProtocol {
    
    func showList(list: [String]) {
        toDoList = list
        tableView.reloadData()
    }
 
    func showAlert(title title: String, description: String) {
        let alertController = UIAlertController(title: title,
                                              message: description,
                                       preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) {
            alertAction in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

// MARK: UITableViewDataSource

extension ListView : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = initCell()
        
        if let text = toDoList?[indexPath.row] {
            setupCell(cell, text: text)
        }
        
        return cell
    }
    
    // MARK: Private
    
    private func initCell() -> UITableViewCell {
        let identifier = String(UITableViewCell)
        return tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
    }
    
    private func setupCell(cell: UITableViewCell, text: String) {
        cell.textLabel?.text = text
    }
    
}