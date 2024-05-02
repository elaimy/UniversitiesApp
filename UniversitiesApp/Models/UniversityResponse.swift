//
//  UniversityResponse.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import Foundation

struct University: Codable {
    let name: String
    let stateProvince: String?
    let domains: [String]
    let webPages: [URL]
    let country: String
    let alphaTwoCode: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}

extension University {
    func toRealm() -> UniversityRealm {
        let realmUniversity = UniversityRealm()
        realmUniversity.name = self.name
        realmUniversity.stateProvince = self.stateProvince
        realmUniversity.domains.append(objectsIn: self.domains)
        realmUniversity.webPages.append(objectsIn: self.webPages.map { $0.absoluteString })
        realmUniversity.country = self.country
        realmUniversity.alphaTwoCode = self.alphaTwoCode
        return realmUniversity
    }
}



