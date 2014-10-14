//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Kori Kolodziejczak on 10/13/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GalleryDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "GALLERY_SEGUE"{
      let destinationVC = segue.destinationViewController as GalleryViewController
      destinationVC.delegate = self
    }
  }
  @IBAction func button(sender: AnyObject) {
 
    
    let alertController = UIAlertController(title: "Title", message: "HI", preferredStyle: UIAlertControllerStyle.ActionSheet)
  
    let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default) {(action) -> Void in
        self.performSegueWithIdentifier("GALLERY_SEGUE", sender: self)
    }
    
    let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) { (action) -> Void in
      let imagePicker = UIImagePickerController()
      imagePicker.allowsEditing = true
      if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
        
      }
      imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
      imagePicker.delegate = self
      self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
  self.presentViewController(alertController, animated: true, completion: nil)
  
    alertController.addAction(galleryAction)

  
  }



  override func viewDidLoad() {
    super.viewDidLoad()
}
  
      override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

func didTapOnPicture(image: UIImage) {
    self.imageView.image = image
  }
}

