//
//  Order.swift
//  bossapp
//
//  Created by ANP on 3/11/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import Foundation

struct Order:Codable,Equatable{
    
    struct Name:Codable,Equatable {
        let title:String
        let first:String
        let last:String
        var full: String{
            return (self.title).uppercased()
        }
    }
}
