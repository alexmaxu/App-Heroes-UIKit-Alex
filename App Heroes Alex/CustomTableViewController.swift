//
//  CustomTableViewController.swift
//  App Heroes Alex
//
//  Created by Alex  on 17/3/24.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    let logic = HeroLogic.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return logic.heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let hero = logic.getHero(indexPath: indexPath)
        
        cell.age.text = String(hero.edad)
        cell.nameApodo.text = hero.apodo
        cell.realName.text = hero.nombreReal
        cell.customImage.image = UIImage(named: hero.imagen)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let hero = logic.getHero(indexPath: indexPath)
        let fav = logic.isFavorited(hero: hero)
        let action = UIContextualAction(style: .normal, title: "Favorited") { _, _, result in
            self.logic.toggleFavorite(hero: hero)
            result(true)
        }
        action.image = UIImage(systemName: fav ? "star" : "star.fill")
        action.backgroundColor = !fav ? .gray : .black
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    @IBSegueAction func goDetail(_ coder: NSCoder) -> HeroDetailTableViewController? {
        guard let selected = tableView.indexPathForSelectedRow else { return nil }
        let detail = HeroDetailTableViewController(coder: coder)
        detail?.selectedHero = logic.getHero(indexPath: selected)
        return detail
    }
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let selected = tableView.indexPathForSelectedRow,
//              let destination = segue.destination as? HeroDetailTableViewController else {
//            return
//        }
//        destination.selectedHero = logic.getHero(indexPath: selected)
//    }
    
}
