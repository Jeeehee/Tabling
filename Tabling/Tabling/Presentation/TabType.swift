//
//  TabType.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import Foundation

enum TabType: Int, CaseIterable {
    case first, second
    
    var title: String {
        switch self {
        case .first: return "저장"
        case .second: return "최근본"
        }
    }
}
