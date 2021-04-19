//
//  AddMemberViewController.swift
//  HipoIntern
//
//  Created by Burak Ozay on 9.04.2021.
//

import UIKit


class AddMemberViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var githubTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var yearsInHipoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        
    }
    

    @objc func cancelButtonClicked() {
       performSegue(withIdentifier: "toMembersViewController", sender: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if validate() == true {
            
            var age : Int?
            var hipo_years_in_hipo : Int?
            
            func isStringAnInt(string: String) -> Bool {
                return Int(string) != nil
            }
                        
            let name = nameTextField.text!
            
            if isStringAnInt(string: ageTextField.text!) {
               flagAge = true
                age = Int(ageTextField.text!)
            } else {
                flagAge = false
                makeAlert(title: "Attention !", message: "Please enter a number in age field.")
            }
            
            let location = locationTextField.text!
            let github = githubTextField.text!
            let hipo_position = positionTextField.text!
            
            if isStringAnInt(string: yearsInHipoTextField.text!) {
                flagYear = true
                hipo_years_in_hipo = Int(yearsInHipoTextField.text!)
            } else {
                flagYear = false
                makeAlert(title: "Attention !", message: "Please enter a number in years field.")
            }
           
            if flagAge == true && flagYear == true {
                userData?.members.append(Members(name: name, age: age, location: location, github: github, hipo: Hipo(position: hipo_position, years_in_hipo: hipo_years_in_hipo)))
            }
            
            flag = true
            
            if flag == true {
                writeJSON(location: subUrl!)
                flag = false
            }
            
        } else {
            makeAlert(title: "Attention !", message: "Please fill in all the required fields.")
        }
        performSegue(withIdentifier: "toMembersViewController", sender: nil)
    }
    
    func validate() -> Bool {
        if nameTextField.text!.isEmpty || ageTextField.text!.isEmpty || locationTextField.text!.isEmpty || githubTextField.text!.isEmpty || positionTextField.text!.isEmpty {
            return false
        }
        return true
    }
    
    
    func writeJSON(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(userData)
            try JsonData.write(to: location)
        }catch{}
    }
    
    func makeAlert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
        
}
