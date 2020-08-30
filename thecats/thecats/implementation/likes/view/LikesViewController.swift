//
//  LikesViewController.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LikesViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    static let key = "Likes"
    @IBOutlet weak var loader: UIImageView!
    
    let viewModel = LikesViewModel()
    var collectionView: UICollectionView!
    var likesImages = [LikeImage]()
    var disposeBag = DisposeBag()
    var isCollectionViewAdded = false
    var indexPathSelected: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        binding()
    }
    
    private func layout(){
        loader.image = UIImage.gifImageWithName("loader")
    }
    
    private func binding(){
        viewModel.likesImages.asObservable().subscribe({ likesList in
            self.likesImages = likesList.element!
            if self.likesImages.count > 0 {
                self.loadCollectionView()
            }
        }).disposed(by: disposeBag)
    }
    
    private func loadCollectionView(){
        if !isCollectionViewAdded{
            let layout = UICollectionViewFlowLayout()
            collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(LikeImageCell.self, forCellWithReuseIdentifier:"Cell")
            collectionView.backgroundColor = UIColor.white
            self.view.addSubview(collectionView)
            collectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
            
            isCollectionViewAdded = true
            
            collectionView.reloadData()
        }else{
            if let indexPath = indexPathSelected{
                collectionView.reloadItems(at: [indexPath])
            }else{
                 collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LikeImageCell
        cell.loadData(likeImage: likesImages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPathSelected = indexPath
        viewModel.toggleLike(item:indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        if DeviceInfo.Orientation.isPortrait {
            return CGSize(width: width/4 - 1, height: width/4 - 1)
        } else {
            return CGSize(width: width/6 - 1, height: width/6 - 1)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if collectionView != nil{
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
