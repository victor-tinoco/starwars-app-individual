//
//  People.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 28/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct People: Codable {
    let name: String
    let height: Double
    let mass: Double
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
}
