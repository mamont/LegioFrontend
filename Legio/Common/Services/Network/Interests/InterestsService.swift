//
//  InterestsService.swift
//  Legio
//
//  Created by Mac on 17.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol InterestsService {
    
    func myInterests(completion: @escaping MyInterestsResult)
    func interestsList(completion: @escaping AllInterestsResult)
    func add(idMyInterests: [Int], completion: @escaping MyInterestsResult)
    func update(idMyInterests: [Int], completion: @escaping MyInterestsResult)
    
}

extension InterestsService {
    
    public typealias AllInterestsResult = (Result<InterestsResponse, Error>) -> Void
    public typealias MyInterestsResult = (Result<[Int], Error>) -> Void
}
