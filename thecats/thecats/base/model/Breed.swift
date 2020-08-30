//
//  Breed.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import RealmSwift
class Breed: Object{
    
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var temperament: String = ""
    dynamic var origin: String = ""
    dynamic var descriptionBreed: String = ""
    dynamic var wikipedia: String = ""
    
}
