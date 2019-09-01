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
        case retainCycleClosure
        case retainCycleDelegate
        case retainCycleFunction

        var title: String {
            switch self {
            case .retainCycleClosure: return "Retain cycle: closure"
            case .retainCycleDelegate: return "Retain cycle: delegate"
            case .retainCycleFunction: return "Retain cycle: function"
            }
        }

        var segueIdentifier: String {
            switch self {
            case .retainCycleClosure: return "showRetainCycleClosureSegue"
            case .retainCycleDelegate: return "showRetainCycleDelegateSegue"
            case .retainCycleFunction: return "showRetainCycleFunctionSegue"
            }
        }
    }

    var options: [OutOfMemoryType] {
        return OutOfMemoryType.allCases
    }
}
