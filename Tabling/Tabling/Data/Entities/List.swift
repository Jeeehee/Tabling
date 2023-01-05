//
//  List.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

struct List: Decodable {
    let list: [Restaurant]
}

struct Restaurant: Decodable {
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
