//
//  BreedDetailViewController.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class BreedDetailViewController: BaseViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var breedDescription: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var wikipediaInfo: UIButton!
    
    static let key = "BreedDetail"
    var viewModel:BreedDetailViewModel!
    var breed:Breed!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BreedDetailViewModel(breed:breed)
        layout()
        binding()
    }
    
    private func layout(){
        image.image = UIImage.gifImageWithName("loader")
        nameTitle.text = breed.name
        temperament.text = breed.temperament
        origin.text = breed.origin
        breedDescription.text = breed.descriptionBreed
    }
    
    private func binding(){
        bindWikipediaButton()
        bindImageUrl()
    }
    
    private func bindWikipediaButton(){
        wikipediaInfo.rx.tap.asObservable()
            .subscribe(onNext: { [weak self] _ in
                if let wikipedia = self?.breed.wikipedia{
                    guard let url = URL(string:wikipedia) else { return }
                    UIApplication.shared.open(url)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func bindImageUrl() {
        viewModel.urlImageResponse.asObservable().subscribe({ url in
            if let imageUrl = url.element{
                if !imageUrl.isEmpty{
                    self.image.downloaded(from:imageUrl)
                    self.image.contentMode = .scaleAspectFill
                }
            }
        }).disposed(by: disposeBag)
    }
    
}
