//
//  DeviceRoute.swift
//
//
//  Created by Erik Schnell on 21.03.2024.
//

import Foundation

public class DeviceRoute: RouteProtocol {
    public static var path: String = "devices"
    
    public init() {}
    
    public struct CreateRequest: RequestProtocol {
        public typealias RequestBody = CreateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public var deviceType: DeviceType?
            public var uniqueIdentifier: UUID?
            public var modus: DeviceModus?
            
            public init(deviceType: DeviceType, uniqueIdentifier: UUID, modus: DeviceModus) {
                self.deviceType = deviceType
                self.uniqueIdentifier = uniqueIdentifier
                self.modus = modus
            }
        }
        
        public init() {}
    }
    
    public struct DeleteRequest: RequestProtocol {
        public typealias RequestBody = DeleteRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "delete"
        
        public struct DeleteRequestBody: Codable {
            public var uniqueIdentifier: UUID
            
            public init(uniqueIdentifier: UUID) {
                self.uniqueIdentifier = uniqueIdentifier
            }
        }
        
        public init() {}
    }
    
    public struct GetAllRequest: RequestProtocol {
        public typealias RequestBody = Empty
        public typealias ResponseBody = [Device]
        public let method = HTTPMethod.post
        public let path = "getAll"
        
        public init() {}
    }
    
    public struct InitializeDeviceRequest: RequestProtocol {
        public typealias RequestBody = InitializeDeviceBody
        public typealias ResponseBody = DeviceModus
        public let method = HTTPMethod.post
        public let path = "initialize"
        
        public struct InitializeDeviceBody: Codable {
            public var uniqueIdentifier: UUID
            
            public init(uniqueIdentifier: UUID) {
                self.uniqueIdentifier = uniqueIdentifier
            }
        }

        
        public init() {}
    }
    
}
