//
//  HeroLogic.swift
//  App Heroes Alex
//
//  Created by Alex  on 12/3/24.
//

import Foundation

final class HeroLogic {
    static let shared = HeroLogic()
    
    let interactor: DataInteractor
    
    var heroes: [Hero] = []
    
    init(interactor: DataInteractor = HeroesInteractor.shared) {
        self.interactor = interactor
        fetchHeroes()
    }
    
    func getHero(indexPath: IndexPath) -> Hero {
        heroes[indexPath.row]
    }
    
    func fetchHeroes() {
        do {
            self.heroes = try interactor.getHeroes()
        } catch {
            self.heroes = []
            print(error)
        }
    }
    
    func toggleFavorite(hero: Hero) {
        if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
            heroes[index].favorited.toggle()
        }
    }
    
    func isFavorited(hero: Hero) -> Bool {
        if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
            heroes[index].favorited
        } else {
            false
        }
    }
}

