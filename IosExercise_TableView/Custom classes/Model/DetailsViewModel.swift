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
            for (i, item) in notDetails.enumerated().reversed() {
                if item.title == nil && item.description == nil && item.imageHref == nil {
                    notificationItems.remove(at:i)
                }
            }
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

