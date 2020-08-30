//
//  BreedCell.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit

class BreedCell: UITableViewCell {

    static let key = "BreedViewCell"
     
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(breed: Breed){
        
        title.text = breed.name
        subTitle.text = breed.temperament
        
        icon.image = UIImage(named: Constants.breeds.listIcons.randomElement()!)
        icon.image = self.icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = Constants.colors.orange
    }
}
