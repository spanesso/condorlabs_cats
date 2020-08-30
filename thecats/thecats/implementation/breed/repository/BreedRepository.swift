//
//  BreedRepository.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import Alamofire


class BreedRepository:BaseRepository {
    
    override
    private init(){}
    
    public static let shared = BreedRepository()
    
    public func getBreeds(completionHandler: @escaping ([Breed]) -> Void) -> () {
        let url = Constants.request.getBreeds
        var breeds: [Breed] = []
        self.requestGET(url:url){
            (response)in
            if let data = response{
                breeds = self.parser.decode(from:data)
            }
            completionHandler(breeds)
        }
    }
    
    public func getBreedImageUrl(url:String,completionHandler: @escaping (String) -> Void) -> () {
        self.requestGET(url:url){
            (response)in
            if let data = response{
               let url = self.parser.getBreedImage(from:data)
               completionHandler(url)
            }else{
                completionHandler("")
            }
        }
    }
}
