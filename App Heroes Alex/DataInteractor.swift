//
//  DataInteractor.swift
//  App Heroes Alex
//
//  Created by Alex  on 12/3/24.
//

import Foundation

protocol DataInteractor {
    func getHeroes() throws -> [Hero]
    func saveHero(heroes: [Hero]) throws
}

struct HeroesInteractor: DataInteractor, JSONPersistence {

    static let shared = HeroesInteractor()
    
    private init() {}
    
    func getHeroes() throws -> [Hero] {
        guard let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json") else {
            return []
        }
        return try getJSON(url: url, type: [HeroDTO].self).map(\.toHero)
    }
    
    func saveHero(heroes: [Hero]) throws {
        try putJSON(file: "SuperHeroes.json", json: heroes)
    }
    
}


