//
//  UniversitiesRouter.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

class UniversitiesRouter: UniversitiesRouterProtocol {
    
    static func createModule() -> UIViewController {
        let viewController = UniversitiesViewController()
        let presenter: UniversitiesPresenterProtocol & UniversitiesInteractorOutputProtocol = UniversitiesPresenter()
        let interactor: UniversitiesInteractorInputProtocol = UniversitiesInteractor()
        let router: UniversitiesRouterProtocol = UniversitiesRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    func navigateToDetails(from view: UniversitiesProtocol, withUniversity university: UniversityRealm) {
        guard let viewController = view as? UIViewController else {
            print("Navigation error: View is not a UIViewController")
            return
        }
        print("Navigating to details...")
        let detailsVC = UniversityDetailsRouter.createModule(with: university)
        viewController.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

