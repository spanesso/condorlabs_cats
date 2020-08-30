//
//  Constants.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct app {
        static let name = "Cats"
    }
    
    struct colors {
        static let white = UIColor(hexString:"E6DFDE")
        static let orange = UIColor(hexString:"E3AA6A")
        static let yellow = UIColor(hexString:"EBC493")
    }
    
    struct request {
        static let baseUrl = "https://api.thecatapi.com/v1/"
        static let getBreeds = "\(baseUrl)breeds"
        static let getBreedImage = "\(baseUrl)images/search?breed_ids="
        static let getCatsImages = "\(baseUrl)images/search?limit=40"
    }
    
    struct breeds {
        static let listIcons = ["breed_icon_1","breed_icon_2","breed_icon_3"]
    }
    
}
