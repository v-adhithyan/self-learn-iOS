//
//  ItemsTableViewController.swift
//  Homepwner
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    var itemStore: ItemStore
    let reuseIdentifier = "UITableViewCell"
    
    @IBOutlet var headerView:UIView!
    
    init() {
        self.itemStore = ItemStore()
        
        super.init(style: UITableViewStyle.plain)
        
        let navItem = self.navigationItem
        navItem.title = "Homepwner"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: Selector("addNewItem"))
        
        navItem.rightBarButtonItem = addButton
        
        navItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        //let header = self.getHeaderView()
        //self.tableView.tableHeaderView = self.getHeaderView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemStore.allItems().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        let items = itemStore.allItems()
        let item = items[indexPath.row] as! BNRItem
        
        cell.textLabel?.text = item.describe()
        
        return cell
    }
    
    /*func getHeaderView()-> UIView {
        let array = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.headerView = array?[0] as! UIView
        
        return headerView
    }*/
    
    @IBAction func addNewItem() {
        NSLog("Add New item")
        
        _ = itemStore.createItem()
        let lastRow = itemStore.allItems().count - 1
        let indexPath = NSIndexPath(row: lastRow, section: 0) as IndexPath
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.top)
    }
    
    @IBAction func toggleEditingMode(sender: UIButton) {
        
        if self.isEditing {
            sender.setTitle("Edit", for: UIControlState.normal)
            self.setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: UIControlState.normal)
            self.setEditing(true, animated: true)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = itemStore.allItems().object(at: indexPath.row) as! BNRItem
            itemStore.removeItem(item: item)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        if fromIndexPath.row != to.row {
            let from = fromIndexPath.row
            let item = itemStore.allItems().object(at: from) as! BNRItem
            itemStore.removeItem(item: item)
            
            itemStore.addItem(item: item)
        }
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        
        let items = itemStore.allItems()
        let selectedItem = items.object(at: indexPath.row) as! BNRItem
        detailViewController.item = selectedItem
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
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
