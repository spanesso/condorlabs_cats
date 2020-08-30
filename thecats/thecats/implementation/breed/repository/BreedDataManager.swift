//
//  BreedDataManager.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//


import Foundation

class BreedDataManager {
     
    private let repository = BreedRepository.shared
    
    private init() {}
    
    public static let shared = BreedDataManager()
    
    public func loadBreeds(completionHandler: @escaping ([Breed]) -> Void) -> () {
        self.repository.getBreeds(){
            (breeds)in
            completionHandler(breeds)
        }
    }
    
    public func getBreedImage(url:String,completionHandler: @escaping (String) -> Void) -> () {
        self.repository.getBreedImageUrl(url:url){
            (url)in
            completionHandler(url)
        }
    }
}
