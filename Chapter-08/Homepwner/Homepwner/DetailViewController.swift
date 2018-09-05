//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Adhithyan Vijayakumar on 05/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: BNRItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let item = self.item as BNRItem
        
        self.nameField.text = item.itemName
        self.serialField.text = item.serialNo
        self.valueField.text = "\(item.valueInDollars)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        self.dateLabel.text = dateFormatter.string(from: item.dateCreated as Date)
        
        let displayImage = ImageStore.sharedStore.imageForKey(key: item.itemKey)
        
        if displayImage != nil {
                self.imageField.image = displayImage as! UIImage?
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
        
        let item = self.item
        item?.itemName = self.nameField.text!
        item?.valueInDollars = Int(self.valueField.text!)!
        item?.serialNo = self.serialField.text!
    }
    
    func setItem(item: BNRItem) {
        self.item = item
        self.navigationItem.title = item.itemName
    }
    
    
    @IBAction func takePicture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
            
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        } else {
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        }
            
        imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageField.image = image
        
        ImageStore.getSharedStore().setImage(image: image!, key: item.itemKey)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
