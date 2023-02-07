//
//  Device.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/30/23.
//

import UIKit

struct Device {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

