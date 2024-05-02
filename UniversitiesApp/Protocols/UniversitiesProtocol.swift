//
//  UniversitiesProtocol.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

protocol UniversitiesProtocol: AnyObject {
    var presenter: UniversitiesPresenterProtocol? { get set }
    func showUniversities(_ universities: [University])
    func showError()
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol UniversitiesPresenterProtocol: AnyObject {
    var view: UniversitiesProtocol? { get set }
    var interactor: UniversitiesInteractorInputProtocol? { get set }
    var router: UniversitiesRouterProtocol? { get set }
    func viewDidLoad()
    func showUniversityDetails(forUniversity university: UniversityRealm)
}

protocol UniversitiesInteractorInputProtocol: AnyObject {
    var presenter: UniversitiesInteractorOutputProtocol? { get set }
    func fetchUniversities()
}

protocol UniversitiesInteractorOutputProtocol: AnyObject {
    func didRetrieveUniversities(_ universities: [University])
    func onError()
}

protocol UniversitiesRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToDetails(from view: UniversitiesProtocol, withUniversity university: UniversityRealm)
}


