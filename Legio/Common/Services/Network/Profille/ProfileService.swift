//
//  ProfileService.swift
//  Legio
//
//  Created by Mac on 07.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol ProfileService {
    
    func getProfile(completion: @escaping GetProfileResponse)
    func add(interests: [String], completion: @escaping InterestsResponse)
    func change(interests: [String], completion: @escaping InterestsResponse)
}

extension ProfileService {
    
    public typealias GetProfileResponse = (Result<Profile, Error>) -> Void
    public typealias InterestsResponse = (Result<[String], Error>) -> Void
}
