//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Felipe Valencia  on 11/21/19.
//  Copyright © 2019 Felipe Valencia . All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    //MARK: Properties
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        //Load sample data.
        loadSampleMeals()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequed cell is not an instance of MealTableViewCell")
        }
        // Configure the cell...
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.image
        cell.ratingControl.rating = meal.rating

        return cell
    }
    

    // Allows the table to be edited
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want  the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier ?? "" {
        case "AddItem":
            //Going to add a new meal
            os_log("Adding a new meal", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            // Get destination, cell and index
            guard let mealDetailViewController = segue.destination as? MealViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? MealTableViewCell else {
                fatalError("Unexpected Sender: \(sender ?? "Default value")")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the Table.")
            }
            // Get meal from meals[]
            let selectedMeal = meals[indexPath.row]
            //Pass selectedMeal to MealViewController
            mealDetailViewController.meal = selectedMeal
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
        
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add new Meal
                let newIndexPath = IndexPath(row:meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
        }
    }
    
    //MARK: Private Methods
    private func loadSampleMeals() {
        let ramen_photo = UIImage(named: "ramen")
        let bunuelo_photo = UIImage(named:"buñuelo")
        let carbonara_photo = UIImage(named: "carbonara")
        guard let ramen = Meal(rating: 5, image: ramen_photo, name: "Ramen") else {
            fatalError("Failed to instantiate Ramen")
        }
        guard let bunuelo = Meal(rating: 4, image: bunuelo_photo, name: "Buñuelo") else {
            fatalError("Failed to instantiate Bunuelo")
        }
        guard let carbonara = Meal(rating: 3, image: carbonara_photo, name: "Carbonara") else {
            fatalError("Failed to instantiate Carbonara")
        }
        meals += [ramen,bunuelo,carbonara]
    }
}
