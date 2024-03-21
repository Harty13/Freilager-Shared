//
//  DeviceModus.swift
//
//
//  Created by Erik Schnell on 21.03.2024.
//

import Foundation

public enum DeviceModus: Codable {
    case info
    case angebot(currentAngebot: Angebot?)
    case person(person: Person)
}
