//
//  UniversitiesInteractor.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import Foundation
import RealmSwift

class UniversitiesInteractor: UniversitiesInteractorInputProtocol {
    weak var presenter: UniversitiesInteractorOutputProtocol?
    
    func fetchUniversities() {
        let urlString = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.presenter?.onError()
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                // Handle the error more specifically if needed
                print("Error fetching data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.presenter?.onError()
                }
                return
            }
            
            guard let data = data else {
                // In case there's no error but the data is still nil, which is unusual but should be handled
                DispatchQueue.main.async {
                    self?.presenter?.onError()
                }
                return
            }
            
            // Proceed with handling the non-nil data
            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                let realm = try Realm()
                
                try realm.write {
                    universities.forEach { university in
                        let realmUniversity = university.toRealm()
                        realm.add(realmUniversity, update: .modified) // Now works because there is a primary key
                    }
                }
                
                DispatchQueue.main.async {
                    self?.presenter?.didRetrieveUniversities(universities)
                }
            } catch {
                print("Error processing data or writing to Realm: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.presenter?.onError()
                }
            }
        }
        task.resume()
    }
    
}


class UniversityRealm: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var stateProvince: String?
    let domains = List<String>()
    let webPages = List<String>()
    @objc dynamic var country: String = ""
    @objc dynamic var alphaTwoCode: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}





