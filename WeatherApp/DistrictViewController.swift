//
//  DistrictViewController.swift
//  WeatherApp
//
//  Created by apple on 3/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

/// Delegate
// Closure

class DistrictViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let districtArray = ["Dhaka","Borishal","Chittagong","Dhaka","Borishal","Chittagong","Dhaka","Borishal","Chittagong","Dhaka","Borishal","Chittagong","Dhaka","Borishal","Chittagong"]

    var selectDistrictClosure:(( _ district: String)->Void)?
    var selectedDistrict = ""

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districtArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if selectedDistrict == districtArray[indexPath.row]{
            cell?.textLabel?.textColor = UIColor.blue
        }
        else{
            cell?.textLabel?.textColor = UIColor.black
        }
        cell?.textLabel?.text = districtArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
       // vc.selectedDistrict = districtArray[indexPath.row]
       // self.navigationController?.pushViewController(vc, animated: true)
        if let sdh = selectDistrictClosure {
            sdh(districtArray[indexPath.row])
        }
//        guard let sd = selectDistrictClosure else {
//            return
//        }
//        sd("dd")
       
      
        //vc.selectedDistrict = districtArray[indexPath.row]
        self.navigationController?.popViewController(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
