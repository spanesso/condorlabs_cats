//
//  LikesDataManager.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation

class LikesDataManager {
    
    private let repository = LikesRepository.shared
    private let storageHelper = StorageHelper.shared
    
    private init() {}
    
    public static let shared = LikesDataManager()
    
    public func getCatsImags(completionHandler: @escaping ([LikeImage]) -> Void) -> () {
        let likeImages = storageHelper.loadLikesImages()
        if likeImages.count == 0 {
            self.repository.getCatImages(){
                (likesImages)in
                
                for likeImage in likesImages {
                    self.storageHelper.addNewLikeImage(like: likeImage)
                }
                completionHandler(likesImages)
            }
        }else{
            completionHandler(likeImages)
        }
    }
    
    public func toggleLike(item:Int,completionHandler: @escaping ([LikeImage]) -> Void) -> () {
        let likeImages = storageHelper.loadLikesImages()
        let likeItem = likeImages[item]
        
        let updatedLike = LikeImage()
        updatedLike.id  = likeItem.id
        updatedLike.name  = likeItem.name
        updatedLike.date  = likeItem.date
        updatedLike.url  = likeItem.url
        updatedLike.like = !likeItem.like
        
        storageHelper.toggleLike(like:updatedLike){
            (updatedList)in
            completionHandler(updatedList)
        }
    }
}
