//
//  JSONLoader.swift
//  App Heroes Alex
//
//  Created by Alex  on 12/3/24.
//

import Foundation

protocol JSONPersistence {
    func getJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable
    func putJSON<JSON>(file: String, json: JSON) throws where JSON: Codable
}

extension JSONPersistence {
    func getJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable {
        
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder().decode(type, from: data)
    }
    
    func putJSON<JSON>(file: String, json: JSON) throws where JSON: Codable {
        let url = URL.documentsDirectory.appending(path: file)
        let data = try JSONEncoder().encode(json)
        try data.write(to: url, options: .atomic)
    }
}
