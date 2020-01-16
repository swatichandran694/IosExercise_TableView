//
//  DetailsViewModel.swift
//  IosExercise_TableView
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import Foundation

protocol DetailsViewModelProtocol {
    var model : DetailsAPI? { get set }
    func numberOfRows() -> Int
    func itemAtIndex(index: Int) -> DetailsData?
    var navigationTitle: String? { get }
    
}

class DetailsViewModel: DetailsViewModelProtocol {
    var notificationItems =  [DetailsData]()
    var model: DetailsAPI? {
        didSet{
            guard let deails = model?.getDetails() else { return }
            self.notificationItems = deails
        }
    }
    
    var navigationTitle: String? {
        return "Books History"
    }
    
    func numberOfRows() -> Int {
        return notificationItems.count
    }
    
    func itemAtIndex(index: Int) -> DetailsData? {
        return notificationItems[index]
    }
    
}

