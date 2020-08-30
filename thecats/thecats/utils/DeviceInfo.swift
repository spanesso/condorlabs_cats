//
//  DeviceInfo.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/29/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import UIKit

struct DeviceInfo {
    struct Orientation {
        
        static var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isLandscape
                    : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
    
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isPortrait
                    : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }
}
