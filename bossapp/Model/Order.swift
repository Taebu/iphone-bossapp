 //
 //  Order.swift
 //  bossapp
 //
 //  Created by ANP on 3/4/19.
 //  Copyright © 2019 ANPR. All rights reserved.
 //
 
 import Foundation
 
 /// 코드블록 9-2-1
 
 // 친구 개개인의 정보를 표현할 모델 구조체
 struct Order: Codable, Equatable {
    
    // MARK: - Nested Type
    /*
    struct Address: Codable, Equatable {
        let mb_addr1: String
        let mb_addr2: String
        
        var full: String {
            return "\(self.mb_addr1)  \(self.mb_addr2)"
        }
    }
    */
    
    // MARK: - Properties
    
    let mb_addr1: String
    let mb_addr2: String
    let insdate: String
    let st_name: String
    let Tradeid: String

 }
 
 // MARK: - Coding Keys
 extension Order {
    enum CodingKeys: String, CodingKey {
        case mb_addr1,mb_addr2, insdate, st_name, Tradeid
    }
 }
 
 /* 주문 상태를 변경 한다. */
 extension Order {
    static func setOrder(_ order:Order, completion:((_ isSuccess: Bool) -> Void)? = nil){
    
    }
 }
