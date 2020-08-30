//
//  StorageHelper.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import RealmSwift

class StorageHelper{
    
  let uiRealm = try! Realm()
  
  private init() {}
  
  public static let shared = StorageHelper()
  
  public func loadLikesImages() -> [LikeImage]{
    return Array(uiRealm.objects(LikeImage.self))
  }
  
  public func addNewLikeImage(like: LikeImage) {
    try! uiRealm.write {
      uiRealm.add(like)
    }
  }
  
  public func clearAllLikeImages() {
    try! uiRealm.write {
      uiRealm.delete(uiRealm.objects(LikeImage.self))
    }
  }
    
    public func toggleLike(like:LikeImage,completionHandler: @escaping ([LikeImage]) -> Void) -> () {
        try! uiRealm.write {
            uiRealm.add(like, update: Realm.UpdatePolicy.all)
            completionHandler(Array(uiRealm.objects(LikeImage.self)))
        }
    }
}
