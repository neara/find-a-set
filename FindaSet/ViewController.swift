//
//  ViewController.swift
//  FindaSet
//
//  Created by Ana Trakhtman on 5/9/15.
//  Copyright (c) 2015 Ana Trakhtman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UIImagePickerController
extension ViewController: UIImagePickerControllerDelegate {
    @IBAction func selectPhoto(sender: UIButton) {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            println("ERROR: Can't access photo library!")
            return
        }
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = true

        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func takePhoto(sender: UIButton) {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            println("ERROR: Camera not found!")
            return
        }

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        imagePicker.allowsEditing = true

        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {

            imagePicker.dismissViewControllerAnimated(true, completion: nil)
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
}