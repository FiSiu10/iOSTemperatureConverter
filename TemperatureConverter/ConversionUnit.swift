//  This is the model file of the MVC
//  ConversionUnit.swift
//  TemperatureConverter
//
//  Created by Fiona Siu on 2018-02-14.
//  Copyright © 2018 Fiona Siu. All rights reserved.
//

import UIKit
import Foundation

class ConversionUnit: NSObject{
    var tempField: String
    var leftButton: String
    var rightButton: String
    var leftConversion: (String) -> String
    var rightConversion: (String) -> String
    
    init(tempField: String, leftButton: String, rightButton: String, leftConversion: @escaping (String) -> String, rightConversion: @escaping (String) -> String){
        self.tempField = tempField
        self.leftButton = leftButton
        self.rightButton = rightButton
        self.leftConversion = leftConversion
        self.rightConversion = rightConversion
    }
}
