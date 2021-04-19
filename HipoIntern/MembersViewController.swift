//
//  ViewController.swift
//  HipoIntern
//
//  Created by Burak Ozay on 9.04.2021.
//

import UIKit

var userData : Company?
var currentIndex = 0
var fm = FileManager.default
var mainUrl: URL? = Bundle.main.url(forResource: "hipojson", withExtension: "json")
var subUrl: URL?
var flag : Bool = true
var flagAge : Bool = true
var flagYear : Bool = true


class MembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parseJSON()
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
               //JSON
    
    func parseJSON() {
        
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("hipojson.json")
//the JSON file in mainUrl variable is not editable via the program, that’s why I need to append another JSON file in document directory.
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL) {
        if fm.fileExists(atPath: subPath.path) {
            decodeData(pathName: subPath)
            
            if userData == nil {
                decodeData(pathName: mainPath)
            }
            
        }else {
            decodeData(pathName: mainPath)
        }
        
        self.tableView.reloadData()
    }
    
    func decodeData(pathName: URL) {
        do {
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            userData = try decoder.decode(Company.self, from: jsonData)
        } catch {}
    }
 
   
                             //TABLE VİEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let userData = userData {
            return userData.members.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = userData?.members[indexPath.row].name
        let cell = UITableViewCell()
        cell.textLabel?.text = text
        return cell
    }
    
    
           //SHOWING MEMBER DETAILS WITH didSelectRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
                
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toAddMemberVC", sender: nil)
        
    }
    
        // SORTING
    
    @IBAction func sortButtonClicked(_ sender: Any) {
    
        var newMembersArray = [String]()
        
        for member in (userData?.members)! {
            newMembersArray.append(member.name)
        }
        
        var lastNameArray = [String]()
        
        for lastName in newMembersArray {
        let myLastNames = lastName.split(separator: " ").map({ (substring) in
                                                String(substring)}).last
            lastNameArray.append(myLastNames!)
        }
        
       var dict = [String : String]()
        
       for (key,value) in zip(lastNameArray, newMembersArray) {
            dict.updateValue(value, forKey: key)
        }
    
        selectionSort(array: &lastNameArray, char: "a")
        
        var sortedArray = [String]()
        
        for y in lastNameArray {
           for x in dict  {
                if x.key == y {
                    sortedArray.append(x.value)
                }
            }
        }
            
        var count = -1
        
        for y in sortedArray {
            for x in (userData?.members)! {
                if x.name == y {
                    count = count+1
                    userData?.members.insert(x, at: count)
                }
            }
        }
        
        let countLast = (userData?.members.count)!/2
        userData?.members.removeLast(countLast)
        
               self.tableView.reloadData()
        
    }

}






