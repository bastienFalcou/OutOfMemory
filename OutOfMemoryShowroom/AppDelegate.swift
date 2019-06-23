//
//  AppDelegate.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 6/23/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        var properties: [String: String] = [:]

        if let footprint = memoryFootprint {
            properties["memory"] = String(format: "%d MB", footprint / 1024 / 1024)
        }

        // Trigger "Analytics Event" or "Non-Fatal Crash"
    }

    private var memoryFootprint: mach_vm_size_t? {
        guard let memory_offset = MemoryLayout.offset(of: \task_vm_info_data_t.min_address) else {
            return nil
        }
        let TASK_VM_INFO_COUNT = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<integer_t>.size)
        let TASK_VM_INFO_REV1_COUNT = mach_msg_type_number_t(memory_offset / MemoryLayout<integer_t>.size)
        var info = task_vm_info_data_t()
        var count = TASK_VM_INFO_COUNT
        let kr = withUnsafeMutablePointer(to: &info) { infoPtr in
            infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) { intPtr in
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
            }
        }
        guard kr == KERN_SUCCESS, count >= TASK_VM_INFO_REV1_COUNT else {
            return nil
        }
        return info.phys_footprint
    }
}
