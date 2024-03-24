//
//  CustomTableViewCell.swift
//  App Heroes Alex
//
//  Created by Alex  on 17/3/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameApodo: UILabel!
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var customImage: UIImageView!

    override func awakeFromNib() {
        customImage.layer.cornerRadius = 15.0
    }
    
    override func prepareForReuse() {
        nameApodo.text = nil
        realName.text = nil
        age.text = nil
        customImage.image = nil
    }
}
