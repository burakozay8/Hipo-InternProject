//
//  DetailsViewController.swift
//  HipoIntern
//
//  Created by Burak Ozay on 9.04.2021.
//

import UIKit



class DetailsViewController: UIViewController {

    @IBOutlet weak var companyText: UITextField!
    @IBOutlet weak var teamText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var githubText: UITextField!
    @IBOutlet weak var positionText: UITextField!
    @IBOutlet weak var yearsInHipoText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailsTexts()
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancelButtonClicked))
        

    }
    
                //SHOWING DETAILS
    
    func DetailsTexts() {
        
            companyText.text = userData?.company
            teamText.text = userData?.team
            nameText.text = userData?.members[currentIndex].name
            ageText.text = "\((userData?.members[currentIndex].age)!)"
            locationText.text = userData?.members[currentIndex].location
            githubText.text = userData?.members[currentIndex].github
            positionText.text = userData?.members[currentIndex].hipo.position
            yearsInHipoText.text = "\((userData?.members[currentIndex].hipo.years_in_hipo)!)"
        
    
    }
    
    @objc func cancelButtonClicked() {
        performSegue(withIdentifier: "toMembersVC", sender: nil)
    }

}
