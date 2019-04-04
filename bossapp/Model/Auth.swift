//
//  Auth.swift
//  bossapp
//
//  Created by ANP on 3/29/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import Foundation

/// 코드블록 9-2-1

// 친구 개개인의 정보를 표현할 모델 구조체
struct Auth: Codable, Equatable {
    
    // MARK: - Properties
    
    let success: Bool
    let auth: String
    
}

// MARK: - Coding Keys
extension Auth {
    enum CodingKeys: String, CodingKey {
        case success,auth
    }
}
