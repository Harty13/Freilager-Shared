//
//  Device.swift
//
//
//  Created by Erik Schnell on 21.03.2024.
//

import Foundation

public struct Device: Identifiable, Codable {
    public var id: UUID?
    public var deviceType: DeviceType?
    public var uniqueIdentifier: UUID?
    public var modus: DeviceModus?
    public var deviceStatus: DeviceStatus?
    public var kommentar: String?
}

