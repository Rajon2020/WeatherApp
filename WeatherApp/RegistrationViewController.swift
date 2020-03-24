
import UIKit

class RegistrationViewController: UIViewController {
    
    //Mark: Outlet of registration fields
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var district: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    
    var selectedDistrict = ""
    
    @IBAction func selectButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "DistrictViewController") as! DistrictViewController
        vc.selectDistrictClosure = { (dist) in
            print(dist)
            self.selectedDistrict = dist
            self.updateDistrict()
        }
        vc.selectedDistrict = self.selectedDistrict
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    //Mark: to go signin page
    @IBAction func singin(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func updateDistrict() {
        district.text = selectedDistrict

    }
    
    //Mark: Submit button is clicked, submit data to Api
    @IBAction func submitButton(_ sender: UIButton) {
        let dropView = DropDownView.fromNib()
        dropView.backgroundColor = UIColor.red
        dropView.frame = CGRect(x: 100, y: 100, width: 200, height: 300)
        self.view.addSubview(dropView)
        return
        postdata()
    }
    
    func postdata(){
        let parameters = ["FirstName":firstName.text,"LastName":lastName.text,"mobile":mobileNumber.text,"email":email.text,"gender":gender.text,"district":district.text,"location":location.text,"password":password.text] as [String:Any]
        //create the url with URL
        
        let url = URL(string: "http://192.168.0.30/bdweather/API/registration.php")!
        
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
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        })
            
            task.resume()

        
    }
    
}



extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
