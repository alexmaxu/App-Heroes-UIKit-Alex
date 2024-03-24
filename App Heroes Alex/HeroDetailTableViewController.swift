//
//  HeroDetailTableViewController.swift
//  App Heroes Alex
//
//  Created by Alex  on 13/3/24.
//

import UIKit

class HeroDetailTableViewController: UITableViewController {

    @IBOutlet weak var ImageDetail: UIImageView!
    @IBOutlet weak var apodo: UILabel!
    @IBOutlet weak var poderes: UILabel!
    @IBOutlet weak var historiaText: UILabel!
   
    var selectedHero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let poderList = selectedHero?.poderes
            .map({ $0.rawValue })
            .formatted(.list(type: .and))
        
        ImageDetail.image = UIImage(named: selectedHero?.imagen ?? "hola")
        apodo.text = selectedHero?.apodo
        poderes.text = poderList
        historiaText.text = selectedHero?.descripcion ?? selectedHero?.historia
    }

}
