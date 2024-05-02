//
//  UniversitiesViewController.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit
import RealmSwift

class UniversitiesViewController: UIViewController, UniversitiesProtocol {
        
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UniversitiesPresenterProtocol?
    var universities: Results<UniversityRealm>?
    private var loadingIndicator: UIActivityIndicatorView?
    var interactor: UniversitiesInteractorInputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLoadingIndicator()
        presenter?.viewDidLoad()
        setupTableView()
        self.showLoadingIndicator()
        interactor?.fetchUniversities()
        
    }


    func showUniversities(_ universities: [University]) {
        let realm = try! Realm()
        self.universities = realm.objects(UniversityRealm.self) 
        tableView.reloadData()
    }


    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Unable to fetch universities.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    
    private func setupTableView() {
        tableView.register(UINib(nibName: "UniversityCell", bundle: nil), forCellReuseIdentifier: "UniversityCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator?.center = self.view.center
        loadingIndicator?.hidesWhenStopped = true
        if let indicator = loadingIndicator {
            self.view.addSubview(indicator)
        }
        
        
    }
    
    func showLoadingIndicator() {
        loadingIndicator?.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingIndicator?.stopAnimating()
    }
    
}

extension UniversitiesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as? UniversityCell,
              let uniDetails = universities?[indexPath.row] else { return UITableViewCell() }
        cell.configCell(uniDetails: uniDetails)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let university = universities?[indexPath.row] {  // Make sure `universities` is your data source array
            print("University selected: \(university.name)")
            presenter?.showUniversityDetails(forUniversity: university)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
