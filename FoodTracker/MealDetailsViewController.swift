//
// Created by Sandy on 26/06/17.
// Copyright (c) 2017 gsaandy. All rights reserved.
//

import Foundation
import UIKit

class MealDetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let defaultText = "Default Text"

    //MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!

    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func typingMealName(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBAction func changeMealName(_ textField: UITextField) {
        textField.resignFirstResponder()
        mealNameLabel.text = textField.text
    }
    
    @IBAction func selectImageFromPhotos(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
}
