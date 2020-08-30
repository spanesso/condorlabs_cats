//
//  LikesViewModel.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import RxSwift

class LikesViewModel {
    
    let dataManager = LikesDataManager.shared
    var likesImages = Variable<[LikeImage]>([])
    
    init() {
        getLikesImages()
    }
    
    func getLikesImages() {
        dataManager.getCatsImags(){
            (likeImages)in
            self.likesImages.value = likeImages
        }
    }
    
    func toggleLike(item:Int){
        dataManager.toggleLike(item:item){
            (likeImages)in
            self.likesImages.value = likeImages
        }
    }
}
