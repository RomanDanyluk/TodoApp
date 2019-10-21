//
//  CategotyTableViewController.swift
//  Todoey
//
//  Created by Romaha  on 10/17/19.
//  Copyright © 2019 Romaha . All rights reserved.
//

import UIKit
import RealmSwift

class CategotyTableViewController: UITableViewController {
    
    let realm = try! Realm()

    var categories : Results<Category>?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()
    }
    
    // MARK: TableViewDataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
       
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added"
        
        return cell
    }
    
    // MARK: TableViewDelegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }

    // MARK: Data manipulation Methods
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    // MARK: Load new Category
    
    func loadCategory() {
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    // MARK: - Add new Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            
            
            self.save(category: newCategory)
            
        }
        
        alert.addTextField(configurationHandler: { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
