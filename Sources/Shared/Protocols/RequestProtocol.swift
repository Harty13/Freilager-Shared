//
//  RequestProtocol.swift
//
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public protocol RequestProtocol {
    associatedtype RequestBody: Codable
    associatedtype ResponseBody: Codable
    var method: HTTPMethod { get }
    var path: String { get }
}
