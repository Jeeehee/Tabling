//
//  TabType.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import Foundation

enum TabType: Int, CaseIterable {
    case save, resent
    
    var title: String {
        switch self {
        case .save: return "저장"
        case .resent: return "최근본"
        }
    }
}
