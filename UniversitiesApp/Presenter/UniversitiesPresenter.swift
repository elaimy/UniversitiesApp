//
//  UniversitiesPresenter.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import Foundation

class UniversitiesPresenter: UniversitiesPresenterProtocol, UniversitiesInteractorOutputProtocol {
    
    
    weak var view: UniversitiesProtocol?
    var interactor: UniversitiesInteractorInputProtocol?
    var router: UniversitiesRouterProtocol?

    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor?.fetchUniversities()
    }

    func didRetrieveUniversities(_ universities: [University]) {
        view?.showUniversities(universities)
        view?.hideLoadingIndicator()
    }
    
    func onError() {
        view?.showError()
        view?.hideLoadingIndicator()
    }
    
    func showUniversityDetails(forUniversity university: UniversityRealm) {
        print("Requesting navigation to details for: \(university.name)")
        router?.navigateToDetails(from: view!, withUniversity: university)
    }
}



