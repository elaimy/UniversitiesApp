//
//  UniversityDetailsPresenter.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import Foundation

class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    var router: (any UniversityDetailsRouterProtocol)?
    
    weak var view: UniversityDetailsViewProtocol?
    var university: UniversityRealm?

    func viewDidLoad() {
        if let university = university {
            view?.showUniversityDetails(university)
        }
    }
}

