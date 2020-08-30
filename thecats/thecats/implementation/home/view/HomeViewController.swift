//
//  HomeViewController.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loader: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()
    var breeds: [Breed] = []
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        binding()
    }
    
    private func layout(){
        navigationController?.navigationBar.topItem?.title = Constants.app.name
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:Constants.colors.orange]
        
        
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Likes", style: .plain, target: self, action: #selector(showLikesView))
        
        
        
        tableView.register(UINib(nibName: BreedCell.key, bundle: nil), forCellReuseIdentifier: BreedCell.key)
        loader.image = UIImage.gifImageWithName("loader")
    }
    
    @objc private func showLikesView(sender: UIButton){
        let likesViewController = Controllers.likesImages() 
        navigationController?.pushViewController(likesViewController, animated: true)
    }
    
    private func binding(){
        bindLoader()
        bindTableView()
        bindSearchBar()
    }
    
    private func bindTableView() {
        viewModel.breeds.asObservable()
            .bind(to:tableView.rx.items) { (tableView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: BreedCell.key, for: indexPath) as! BreedCell
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.loadData(breed: element)
                return cell
        }
        .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Breed.self).subscribe(onNext: {
            item in
            self.showBreedDetail(breed: item)
        }).disposed(by: disposeBag)
    }
    
    private func bindSearchBar() {
        searchBar.rx.text.asObservable()
            .filter{$0 != nil}
            .subscribe(onNext: {
                text in
                self.viewModel.filter(text: text!)
            }).disposed(by: disposeBag)
    }
    
    private func bindLoader() {
        viewModel.hideLoader.asObservable().subscribe({ hideLoader in
            self.loader.isHidden = hideLoader.element!
            self.tableView.isHidden = !hideLoader.element!
        }).disposed(by: disposeBag)
    }
    
    private func showBreedDetail(breed:Breed){
        let breedDetailViewController = Controllers.breedInfo()
        breedDetailViewController.breed = breed
        navigationController?.pushViewController(breedDetailViewController, animated: true)
    }
}

