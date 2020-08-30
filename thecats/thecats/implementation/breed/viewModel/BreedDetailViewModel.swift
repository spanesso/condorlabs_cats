//
//  BreedDetailViewModel.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//
 

import Foundation
import RxSwift

class BreedDetailViewModel {
    
    var breedDetail:Breed!
    let dataManager = BreedDataManager.shared
    var urlImageResponse = Variable<String>("")
    
    
    init(breed:Breed) {
        breedDetail = breed
        loadBreedInformation()
    }
    
    func loadBreedInformation(){
        let url = "\(Constants.request.getBreedImage)\(breedDetail.id)"
        dataManager.getBreedImage(url:url){
            (url)in
            self.urlImageResponse.value = url
        }
    }
}


