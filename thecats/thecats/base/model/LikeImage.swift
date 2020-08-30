//
//  LikeImage.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import RealmSwift

class LikeImage: Object{
    
    @objc dynamic var id: Int32 = -1
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var like: Bool = false
    
    override class func primaryKey() -> String? {
           return "id"
       }
    
}

