//  This application converts inputted values to the unit conversion as chosen by the user
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Fiona Siu on 2018-01-25.
//  Copyright © 2018 Fiona Siu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var convertTitle: UILabel!
    @IBOutlet weak var tResult: UILabel!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    var item: ConversionUnit?
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item{
            self.convertTitle.text = item.tempField
            self.leftButton.setTitle(item.leftButton, for: .normal)
            self.rightButton.setTitle(item.rightButton, for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField:UITextField)->Bool{
        self.tempField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftConvert(_ sender: Any) {
        self.tResult.text = item?.leftConversion(self.tempField.text ?? "")
    }
 
    @IBAction func rightConvert(_ sender: Any) {
        self.tResult.text = item?.rightConversion(self.tempField.text ?? "")
    }
    
}

