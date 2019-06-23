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
    }

    var options: [OutOfMemoryType] {
        return OutOfMemoryType.allCases
    }
}
