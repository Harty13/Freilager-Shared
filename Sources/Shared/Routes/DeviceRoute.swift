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
            public var uniqueIdentifier: UUID
            public var deviceType: DeviceType
            public var deviceModus: DeviceModus
            public var owner: Person?
            public var kommentar: String?
            
            public init(uniqueIdentifier: UUID, deviceType: DeviceType, deviceModus: DeviceModus, owner: Person? = nil, kommentar: String? = nil) {
                self.uniqueIdentifier = uniqueIdentifier
                self.deviceType = deviceType
                self.deviceModus = deviceModus
                self.owner = owner
                self.kommentar = kommentar
            }
        }
        
        public init() {}
    }
    
    public struct UpdateRequest: RequestProtocol {
        public typealias RequestBody = UpdateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "update"
        
        public struct UpdateRequestBody: Codable {
            public var id: UUID
            public var kommentar: String?
            
            public init(id: UUID, kommentar: String?) {
                self.id = id
                self.kommentar = kommentar
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
            public var id: UUID
            
            public init(id: UUID) {
                self.id = id
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
