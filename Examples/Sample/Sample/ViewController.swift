//
//  ViewController.swift
//  Sample
//
//  Created by Ignacio Romero on 12/18/15.
//  Copyright © 2015 DZN Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: #selector(deleteAll))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addItem))
        
        self.view.addSubview(self.tableView)
        
        items = ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    func deleteAll() {
        
        let count = items.count
        self.items = []
        
        var idxPaths: [NSIndexPath] = []
        for i in 0..<count {
            idxPaths.append(NSIndexPath(forRow: i, inSection: 0))
        }
            
        self.tableView.beginUpdates()
        self.tableView.deleteRowsAtIndexPaths(idxPaths, withRowAnimation: .Bottom)
        self.tableView.endUpdates()
        
        
//        self.items = []
//        self.tableView.reloadData()
    }
    
    func addItem() {
        
        self.items += ["Hello"]

        self.tableView.beginUpdates()
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: items.count-1, inSection: 0)], withRowAnimation: .Bottom)
        self.tableView.endUpdates()
        
        
//        self.items += ["Hello"]
//        self.tableView.reloadData()
    }
}

// MARK: - DZNEmptyDataSetSource
extension ViewController: DZNEmptyDataSetSource {

    func titleForEmptyDataSet(scrollView: EmptyDataSetView) -> NSAttributedString? {
        
        let attributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(27), NSForegroundColorAttributeName: UIColor.lightGrayColor()]
        
        return NSAttributedString.init(string: "No items found", attributes: attributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: EmptyDataSetView) -> NSAttributedString? {
        
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(20), NSForegroundColorAttributeName: UIColor.lightGrayColor()]
        
        return NSAttributedString.init(string: "Tap on the Add button to insert new items to this list.", attributes: attributes)
    }
    
    func imageForEmptyDataSet(scrollView: EmptyDataSetView) -> UIImage? {
        return UIImage(named: "placeholder_instagram")
    }
    
    func buttonTitleForEmptyDataSet(scrollView: EmptyDataSetView, state: UIControlState) -> NSAttributedString? {
        
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(18), NSForegroundColorAttributeName: UIColor.redColor()]
        
        return NSAttributedString.init(string: "Tap here to Add", attributes: attributes)
    }
    
    func backgroundColorForEmptyDataSet(scrollView: EmptyDataSetView) -> UIColor? {
        return UIColor.whiteColor()
    }
    
    func verticalOffsetForEmptyDataSet(scrollView: EmptyDataSetView) -> CGFloat {
        return 0
    }
}

// MARK: - DZNEmptyDataSetDelegate
extension ViewController: DZNEmptyDataSetDelegate {
  
    func emptyDataSetShouldDisplay(scrollView: EmptyDataSetView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldFadeIn(scrollView: EmptyDataSetView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(scrollView: EmptyDataSetView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(scrollView: EmptyDataSetView) -> Bool {
        return true
    }
    
    func emptyDataSet(scrollView: EmptyDataSetView, didTapView: UIView) {
        print("didTapView: \(didTapView)")
    }
    
    func emptyDataSetWillAppear(scrollView: EmptyDataSetView) {
        print("emptyDataSetWillAppear")
    }
    
    func emptyDataSetDidAppear(scrollView: EmptyDataSetView) {
        print("emptyDataSetDidAppear")
    }
    
    func emptyDataSetWillDisappear(scrollView: EmptyDataSetView) {
        print("emptyDataSetWillDisappear")
    }
    
    func emptyDataSetDidDisappear(scrollView: EmptyDataSetView) {
        print("emptyDataSetDidDisappear")
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    }
  
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel?.text = items[indexPath.row]
    }
}

// mark: UITableViewDelegate
extension ViewController: UITableViewDelegate {
  
}