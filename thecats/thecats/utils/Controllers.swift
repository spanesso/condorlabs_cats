//
//  Controllers.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit

class Controllers {
    
    static func breedInfo() -> BreedDetailViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name:  BreedDetailViewController.key, bundle: nil)
        let breedDetailViewController = storyBoard.instantiateViewController(withIdentifier: BreedDetailViewController.key) as! BreedDetailViewController
        return breedDetailViewController
    }
    
    
    static func likesImages() -> LikesViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name:  LikesViewController.key, bundle: nil)
        let likesViewController = storyBoard.instantiateViewController(withIdentifier: LikesViewController.key) as! LikesViewController
        return likesViewController
    }
}
