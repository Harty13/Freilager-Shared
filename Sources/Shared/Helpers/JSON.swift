//
//  File.swift
//  
//
//  Created by Erik Schnell on 30.06.2024.
//

import Foundation

public extension JSONDecoder {
    static var shared: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

public extension JSONEncoder {
    static var shared: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }
}

public extension Encodable {
    func encode() throws -> Data {
        return try JSONEncoder.shared.encode(self)
    }
}

public extension Optional where Wrapped: Encodable {
    func encode() throws -> Data? {
        switch self {
        case .some(let wrapped):
            return try wrapped.encode()
        case .none:
            return nil
        }
    }
}

public extension Decodable {
    static func decode(from data: Data) throws -> Self {
        return try JSONDecoder.shared.decode(Self.self, from: data)
    }
}

public extension Optional where Wrapped: Decodable {
    static func decode(from data: Data) throws -> Wrapped? {
        return try JSONDecoder.shared.decode(Wrapped.self, from: data)
    }
}
