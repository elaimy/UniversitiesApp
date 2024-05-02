//
//  UniversityDetailsViewProtocol.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
    func showUniversityDetails(_ university: UniversityRealm)
}

protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    var router: UniversityDetailsRouterProtocol? { get set }
    var university: UniversityRealm? { get set }

    func viewDidLoad()
}

protocol UniversityDetailsRouterProtocol: AnyObject {
    static func createModule(with university: UniversityRealm) -> UIViewController
}
