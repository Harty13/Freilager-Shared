//
//  Device.swift
//
//
//  Created by Erik Schnell on 21.03.2024.
//

import Foundation

public struct Device: Identifiable, Codable {
    public var id: UUID?
    public var uniqueIdentifier: UUID?
    public var deviceType: DeviceType?
    public var deviceModus: DeviceModus
    public var owner: Person?
    public var currentAngebot: Angebot?
    public var currentAngebotCollection: AngebotCollection?
    public var deviceStatus: DeviceStatus
    public var kommentar: String?
    public var createdAt: Date?
    
    public init(
        id: UUID? = nil,
        uniqueIdentifier: UUID? = nil,
        deviceType: DeviceType? = nil,
        deviceModus: DeviceModus,
        owner: Person? = nil,
        currentAngebot: Angebot? = nil,
        currentAngebotCollection: AngebotCollection? = nil,
        deviceStatus: DeviceStatus,
        kommentar: String? = nil,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.uniqueIdentifier = uniqueIdentifier
        self.deviceType = deviceType
        self.deviceModus = deviceModus
        self.owner = owner
        self.currentAngebot = currentAngebot
        self.currentAngebotCollection = currentAngebotCollection
        self.deviceStatus = deviceStatus
        self.kommentar = kommentar
        self.createdAt = createdAt
    }
}

