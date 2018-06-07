//  This controls the first page of the application. It sends which unit and the variables the user wants to convert to the ViewController.
//  ConversionUnitTableViewController.swift
//  TemperatureConverter
//
//  Created by Fiona Siu on 2018-02-14.
//  Copyright © 2018 Fiona Siu. All rights reserved.
//

import UIKit

class ConversionUnitTableViewController: UITableViewController {
    var items = [ConversionUnit]()
    let cellIdentifier = "ConversionUnitTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let temp = ConversionUnit(tempField: "Temperature", leftButton: "ºF to ºC", rightButton: "ºC to ºF", leftConversion: {(value: String) -> (String) in
            if let d = Double(value){
                return String((((d) - 32.0) * 5.0/9.0))
            }else{
                return "N/A"
            }
        }, rightConversion: {(value: String) -> (String) in
            if let d = Double(value){
                return String((d * 9.0/5.0 + 32.0))
            }else{
                return "N/A"
            }
        })
        
        let area = ConversionUnit(tempField: "Area", leftButton: "AC to HA", rightButton: "HA to AC", leftConversion: {(value: String) -> (String) in
            if let d = Double(value){
                // Entered value cannot be negative
                if d >= 0 {
                    return String((d * 0.405))
                }else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        }, rightConversion: {(value: String) -> (String) in
            if let d = Double(value){
                if d >= 0 {
                    return String((d / 0.405))
                }else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        })
        
        let length = ConversionUnit(tempField: "Length", leftButton: "FT to M", rightButton: "M to FT", leftConversion: {(value: String) -> (String) in
            if let d = Double(value){
                if d >= 0 {
                    return String((d * 0.305))
                }
                else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        }, rightConversion: {(value: String) -> (String) in
            if let d = Double(value){
                if d >= 0 {
                    return String((d / 0.305))
                }else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        })
        
        let weight = ConversionUnit(tempField: "Weight", leftButton: "LB to KG", rightButton: "KG to LB", leftConversion: {(value: String) -> (String) in
            if let d = Double(value){
                if d >= 0 {
                    return String((d * 0.454))
                }else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        }, rightConversion: {(value: String) -> (String) in
            if let d = Double(value){
                if d >= 0 {
                    return String((d / 0.454))
                }else{
                    return "Cannot be negative"
                }
            }else{
                return "N/A"
            }
        })
        
        items.append(area)
        items.append(length)
        items.append(temp)
        items.append(weight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversionUnitTableViewCell else{
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }

        let item = items[indexPath.row]
        cell.unitTitle.text = item.tempField
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ShowItem"{
            guard let tempViewController = segue.destination as? UINavigationController else{
                fatalError("Unexpected destination \(segue.destination)")
            }
            
            guard let detailViewController = tempViewController.topViewController as? ViewController else{
                fatalError("Unexpected destination \(segue.destination)")
            }
            
            guard let selectedTableViewCell = sender as? ConversionUnitTableViewCell else{
                fatalError("Unexpected destination \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else{
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            detailViewController.item = items[indexPath.row]
        }
    }
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue){
    }
}
