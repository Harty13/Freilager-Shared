//
//  Rolle.swift
//  
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public enum Rolle: Codable {
    case master
    case admin
    case betreuung
    case student
}

extension Rolle: Comparable {
    public static func < (lhs: Rolle, rhs: Rolle) -> Bool {
        func priority(of role: Rolle) -> Int {
            switch role {
            case .master:
                return 1
            case .admin:
                return 2
            case .betreuung:
                return 3
            case .student:
                return 4
            }
        }
        return priority(of: lhs) < priority(of: rhs)
    }
}
