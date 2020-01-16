//
//  DetailsViewModel.swift
//  IosExercise_TableView
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import Foundation

protocol DetailsViewModelProtocol {
    var model : Details? { get set }
    func numberOfRows() -> Int
    func itemAtIndex(index: Int) -> Rows?
    var navigationTitle: String? { get }
    
}

class DetailsViewModel: DetailsViewModelProtocol {
    var notificationItems =  [Rows]()
    var model: Details? {
        didSet{
            guard let notDetails = model?.rows else { return }
            self.notificationItems = notDetails
        }
    }
    
    var navigationTitle: String? {
        return model?.title
    }
    
    func numberOfRows() -> Int {
        return self.notificationItems.count
    }
    
    func itemAtIndex(index: Int) -> Rows? {
        return self.notificationItems[index]
    }
    
}

