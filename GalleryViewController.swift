//
//  GalleryViewController.swift
//  PhotoFilters
//
//  Created by Kori Kolodziejczak on 10/13/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

protocol GalleryDelegate {
    func didTapOnPicture(image : UIImage)
}

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var images = [UIImage]()
  var delegate: GalleryDelegate?
  
    override func viewDidLoad() {
      super.viewDidLoad()
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
      
      var image1 = UIImage(named: "photo-1.jpg")
      var image2 = UIImage(named: "photo-2.jpg")
      var image3 = UIImage(named: "photo-3.jpg")
      var image4 = UIImage(named: "photo-4.jpg")
      var image5 = UIImage(named: "photo-5.jpg")
      
      self.images.append(image1!)
      self.images.append(image2!)
      self.images.append(image3!)
      self.images.append(image4!)
      self.images.append(image5!)

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return self.images.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryCell", forIndexPath: indexPath) as GalleryCell
    cell.imageView.image = self.images[indexPath.row]
    return cell
  }
  func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    if kind == UICollectionElementKindSectionHeader {
      
    
    let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HEADER", forIndexPath: indexPath) as HeaderView
    
      return view
    } else {
      let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FOOTER", forIndexPath: indexPath) as FooterView
      view.footerCountLabel.text = "\(images.count.description) Photos"
      return view
 
    }
  }
    
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    self.delegate?.didTapOnPicture(self.images[indexPath.row])
    self.dismissViewControllerAnimated(true, completion: nil)
  }

}
