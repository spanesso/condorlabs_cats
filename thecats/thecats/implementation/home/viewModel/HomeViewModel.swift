//
//  HomeViewModel.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    let dataManager = BreedDataManager.shared
    var breeds = Variable<[Breed]>([])
    var hideLoader = Variable(false)
    var cachedBreeds: [Breed] = []
    
    init() {
        loadBreeds()
    }
    
    func loadBreeds() {
        dataManager.loadBreeds(){
            (breeds)in
            self.cachedBreeds = breeds
            self.breeds.value = breeds
            self.hideLoader.value = true
        }
    }
    
    func filter(text: String) {
        if (text.count == 0) {
            breeds.value = cachedBreeds
        } else {
            breeds.value = breeds.value.filter{$0.name.lowercased().contains(text.lowercased())}
        }
    }
}


