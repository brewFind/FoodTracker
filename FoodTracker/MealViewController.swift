//
//  ViewController.swift
//  FoodTracker
//
//  Created by Venkateshwarlu Jangili on 10/23/16.
//  Copyright © 2016 Venkat Jangili. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
        UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Properties of elements in the View
    @IBOutlet weak var txtMealName: UITextField!
    //@IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self is like "this" object in C#
        //Handle the text field's user input through delegate callbacks
        txtMealName.delegate = self
        
        //Enable the save button only if valid text name
        checkValidMealName()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Hide keyboard on the Return Key (in our case we changed it to Done!!);
        txtMealName.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //lblMealName.text = txtMealName.text
        checkValidMealName()
        navigationItem.title = textField.text
        //btnSave.isEnabled = false
    }
    
    func checkValidMealName() {
        //Disable the Save button if the text field is empty
        let text = txtMealName.text ?? ""
        btnSave.isEnabled = !text.isEmpty
    }
    
    //MARK: Navigation
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if btnSave == (sender as? UIBarButtonItem) {
            let name = txtMealName.text ?? ""
            let photo = imgView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    //MARK: Actions of events in the view
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
                //lblMealName.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhoto(_ sender: AnyObject) {
        //Hide the Keyboard
        txtMealName.resignFirstResponder()
        
        //Pick Media From their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked not taken
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        present(imagePickerController, animated:true, completion : nil )
    }
    
    //Dismiss the picker if the user is Cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    // The info dictionary contains multiple representations of the image, and this uses the original.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set the selected Image to image viewer
        imgView.image = selectedImage
        
        //dismiss the Picker
        dismiss(animated: true, completion: nil)
        
    }
    
    
}

