//
//  MenuViewModel.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 6/23/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import Foundation

final class MenuViewModel {
    enum OutOfMemoryType: CaseIterable {
        case retainCycleClosureSelf
        case retainCycleClosureOther
        case retainCycleDelegate

        var title: String {
            switch self {
            case .retainCycleClosureSelf: return "Retain cycle: closure #1"
            case .retainCycleClosureOther: return "Retain cycle: closure #2"
            case .retainCycleDelegate: return "Retain cycle: delegate"
            }
        }
    }

    var options: [OutOfMemoryType] {
        return OutOfMemoryType.allCases
    }
}
