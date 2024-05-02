//
//  UniversityDetailsViewController.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

class UniversityDetailsViewController: UIViewController, UniversityDetailsViewProtocol {
    
    @IBOutlet weak var uniName: UILabel!
    @IBOutlet weak var uniState: UILabel!
    @IBOutlet weak var uniCountry: UILabel!
    @IBOutlet weak var uniCountryCode: UILabel!
    @IBOutlet weak var uniWebPage: UILabel!
    

    var presenter: UniversityDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.viewDidLoad()
    }
    
    func showUniversityDetails(_ university: UniversityRealm) {
        
        uniName.text = university.name
        uniState.text = university.stateProvince
        uniCountry.text = university.country
        uniCountryCode.text = university.alphaTwoCode
        let webPagesText = university.webPages.joined(separator: ", ")
        uniWebPage.text = webPagesText
        
    }

    

}
