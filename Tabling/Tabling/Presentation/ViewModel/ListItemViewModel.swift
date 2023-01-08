//
//  ListItemViewModel.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/08.
//

import Foundation

struct ListItemViewModel {
    let useCase: FetchImageUseCase
    
    let thumbnail: String
    let classification: String
    let summaryAddress: String
    let restaurantName: String
    let rating: Double
    let reviewCount: Int
    let isQuickBooking: Bool
    let isRemoteWaiting: Bool
    let isNew: Bool
    let waitingCount: Int
}

extension ListItemViewModel {
    init(useCase: FetchImageUseCase, restatrants: Restaurant) {
        self.useCase = useCase
        
        self.thumbnail = restatrants.thumbnail
        self.classification = restatrants.classification
        self.summaryAddress = restatrants.summaryAddress
        self.restaurantName = restatrants.restaurantName
        self.rating = restatrants.rating
        self.reviewCount = restatrants.reviewCount
        self.isQuickBooking = restatrants.isQuickBooking
        self.isRemoteWaiting = restatrants.isRemoteWaiting
        self.isNew = restatrants.isNew
        self.waitingCount = restatrants.waitingCount
    }
}
