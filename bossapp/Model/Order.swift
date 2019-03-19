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
    
    // MARK: - Nested Types
  /*
    struct Address: Codable, Equatable {
        let mb_addr1: String
        let mb_addr2: String
        
        var full: String {
            return "\(self.mb_addr1)  \(self.mb_addr2)"
        }
    }
    */
    struct Name: Codable, Equatable {
        let title: String
        let first: String
        let last: String
        var full: String {
            return "\(self.title). \(self.last). \(self.first)"
        }
    }
    
    // MARK: - Properties
    /*
    let address_name: Address
    let insdate: String
    let st_name: String
    let Tradeid: String
*/
    let cell: String
    let name: Name
 }
 
 // MARK: - Coding Keys
 extension Order {
    enum CodingKeys: String, CodingKey {
 //       case name, address_name, insdate,st_name,Tradeid
        case name,cell
    }
 }
 
 /* 주문 상태를 변경 한다. */
 extension Order {
    static func setOrder(_ order:Order, completion:((_ isSuccess: Bool) -> Void)? = nil){
    
    }
 }
