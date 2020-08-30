//
//  LikesRepository.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//
 
import Foundation
import Alamofire

class LikesRepository:BaseRepository {
    
    override
    private init(){}
    
    public static let shared = LikesRepository()
    
    public func getCatImages(completionHandler: @escaping ([LikeImage]) -> Void) -> () {
        let url = Constants.request.getCatsImages
        var images: [LikeImage] = []
        
        self.requestGET(url:url){
            (response)in
            if let data = response{
                images = self.parser.decodeLikeImage(from:data)
            }
            completionHandler(images)
        }
    }

}
