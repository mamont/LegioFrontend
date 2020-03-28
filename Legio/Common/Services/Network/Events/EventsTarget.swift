//
//  EventsTarget.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation
import Moya

enum EventsTarget {
    case getEvents(
        city: String?,
        location: String?,
        distance: Float?,
        metro: String?)
}

extension EventsTarget: TargetType, AccessTokenAuthorizable {
    
    private enum Keys {
        static let contentType = "Content-Type"
        static let header = "X-Auth-Token"
        static let dislikedEvents = "dislikes"
        
        static let city = "city"
        static let location = "location"
        static let distance = "distance"
        static let metro = "metro"
    }
    
    private enum Constants {
        static let contentTypeValue = "application/json"
    }
    
    var baseURL: URL {
        guard let url = URL(string: NetworkSettings.shared.baseUrlString) else {
            fatalError("base Url cannot be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getEvents:
//            if dislikedEvents.count > 0 {
//                let dislikedString = dislikedEvents.map({"\($0)"}).joined(separator: ",")
//                return "/events?\(Keys.dislikedEvents)={\(dislikedString)}"
//
//            } else {
                return "/events"
//            }
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getEvents: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        return JSONEncoding.default
    }
    
    public var task: Task {
        switch self {
        case .getEvents(
        let city,
        let location,
        let distance,
        let metro):
    
            var parameters: [String: Any] = [:]
            if let city = city {
                parameters[Keys.city] = city
            }
            if let location = location {
                parameters[Keys.location] = location
            }
            if let distance = distance {
                parameters[Keys.distance] = distance
            }
            if let metro = metro {
                parameters[Keys.metro] = metro
            }
            
            return .requestParameters(
            parameters: parameters,
            encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return [Keys.contentType: Constants.contentTypeValue]
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
}



