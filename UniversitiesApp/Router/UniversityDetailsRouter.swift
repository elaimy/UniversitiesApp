//
//  UniversityDetailsRouter.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    
    static func createModule(with university: UniversityRealm) -> UIViewController {
        let viewController = UniversityDetailsViewController()
        let presenter = UniversityDetailsPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.university = university  

        return viewController
    }
    
}
