//
//  JSONParser.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser {
    
    func getBreedImage(from rawValue: Data) -> String{
        let json = JSON(rawValue)
        
        guard let url = json[0]["url"].string else{
            return ""
        }
        
        return url
    }
    
    func decode(from rawValue: Data) -> [Breed] {
        let json = JSON(rawValue)
        var breeds: [Breed] = []
        
        guard let items = json.array else {
            print("Invalid JSON array")
            return breeds
        }
        
        for item in items {
            
            guard let id = item["id"].string else{
                return breeds
            }
            
            guard let name = item["name"].string else {
                return breeds
            }
            
            guard let temperament = item["temperament"].string else {
                return breeds
            }
            
            guard let origin = item["origin"].string else {
                return breeds
            }
            
            guard let descriptionBreed = item["description"].string else {
                return breeds
            }
            
            guard let wikipedia = item["wikipedia_url"].string else {
                return breeds
            }
            
            let breed = Breed()
            breed.id = id
            breed.name = name
            breed.temperament = temperament
            breed.origin = origin
            breed.descriptionBreed = descriptionBreed
            breed.wikipedia = wikipedia
            
            breeds.append(breed)
        }
        return breeds
    }
    
    
    func decodeLikeImage(from rawValue: Data) -> [LikeImage] {
        let json = JSON(rawValue)
        var likesImages: [LikeImage] = []
        
        guard let items = json.array else {
            print("Invalid JSON array")
            return likesImages
        }
        
        var count = 0
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let now = df.string(from: Date())
        
        for item in items {
            
            guard let id = item["id"].string else{
                return likesImages
            }
            
            guard let url = item["url"].string else {
                return likesImages
            }
            
            
            let likeImage = LikeImage()
            likeImage.id = Int32(count)
            likeImage.name = id
            likeImage.date = now
            likeImage.url = url
            likeImage.like = false
            
            likesImages.append(likeImage)
            
            count += 1
        }
        return likesImages
    }
    
    
}
