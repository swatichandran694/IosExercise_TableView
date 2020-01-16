//
//  Details.swift
//  IosExercise_TableView
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import Foundation

struct Rows: Codable {
    
    let title: String?
    
    let description: String?
    
    let imageHref: String?
}
struct Details: Codable {
    
    let title: String?
    
    let rows: [Rows]?
}
