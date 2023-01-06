//
//  BadgeType.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/06.
//

import UIKit

enum BadgeType: String {
    case remoteWaiting, quickBooking
    
    var title: String {
        switch self {
        case .remoteWaiting: return "원격줄서기"
        case .quickBooking: return "즉시예약"
        }
    }
    
    var color: UIColor {
        switch self {
        case .remoteWaiting: return .gray
        case .quickBooking: return .tablingRed!
        }
    }
}
