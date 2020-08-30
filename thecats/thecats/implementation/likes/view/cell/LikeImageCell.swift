 
 //
 //  LikeImageCell.swift
 //  thecats
 //
 //  Created by Sebastian Panesso on 8/29/20.
 //  Copyright © 2020 CondorLabs. All rights reserved.
 //
 
 import Foundation
 import UIKit
 
 class LikeImageCell:UICollectionViewCell{
    
    var image = UIImageView()
    var like = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        like.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
        like.image = UIImage(named: "like")
        
        self.addSubview(image)
        self.addSubview(like)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(likeImage: LikeImage){
        like.isHidden = !likeImage.like
        image.downloaded(from:likeImage.url)
        image.contentMode = .scaleAspectFill
    }
 }
 
