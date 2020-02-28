//
//  UIViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
