//
//  BaseViewController.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:Constants.colors.orange]
    }
    
}
