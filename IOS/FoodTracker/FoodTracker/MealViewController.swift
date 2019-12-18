//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Felipe Valencia  on 11/9/19.
//  Copyright © 2019 Felipe Valencia . All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // When a ViewController instance is loaded, it sets itself as the delegate of its nameTextField property.
        textField.delegate = self
        
        // Set up views if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            textField.text = meal.name
            photoImageView.image = meal.image
            ratingControl.rating = meal.rating
        }
        //Enable the save button only if the text field has text
        updateSaveButtonState()
    }
    
    //MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    var meal: Meal?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //MARK: UIImageControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the image picker if the user cancels
        dismiss(animated: true, completion: nil)
    }
    
    // Runs when image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = textField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        meal = Meal(rating: rating, image: photo, name: name)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //Depending on the style of presentation (modal or push), this view controller needs to be dismissed in two different ways
        
        //Dismiss Adding Mode
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        //Dismiss Editing Mode
        else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The mealViewController is not inside a navigation controller.")
        }
    }
    
    
    //MARK: Actions
    //Open Image Controller
    @IBAction func selectImageController(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        print("Going to select image")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    //Hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //Update Label
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the save button while editing.
        saveButton.isEnabled = false
    }
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        //Disable the Save button if the text field is empty.
        let text = textField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

