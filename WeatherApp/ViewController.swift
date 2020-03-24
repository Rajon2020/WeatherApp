//
//  ViewController.swift
//  WeatherApp
//
//  Created by apple on 3/3/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Mark: Outlets of Login fields
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var dropDrown:DropDownView!
    
    @IBOutlet weak var singupButton: UIButton!
    @IBAction func singup(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postdata()
        dropDrown = DropDownView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        dropDrown.backgroundColor = UIColor.gray
        self.view.addSubview(dropDrown)
    }
//Mark: to login
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    func postdata(){
        let parameters = ["mobile":userName.text,"password":password.text] as [String:Any]
        //create the url with URL
        
        let url = URL(string: "http://192.168.0.30/bdweather/API/login.php")!
        
        //create the session object
        let session = URLSession.shared
        
        //now crete the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // set http method as post
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            //pass dictionary to nsdata object and set it as request body
            
        }catch let error {
            print(error.localizedDescription)
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // create datatask using the session object to send data to the server
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data,response,error in guard error == nil else{
            return
            }
            guard let data = data else {
                return
                
            }
            do {
                print(data)
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] {
                    print(json)
                    //handle json
                    print("Login succes")
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        })
            
            task.resume()

        
    }
    
    
}

