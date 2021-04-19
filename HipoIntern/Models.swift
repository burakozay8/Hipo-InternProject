//
//  Models.swift
//  HipoIntern
//
//  Created by Burak Ozay on 9.04.2021.
//

import Foundation

struct Company : Codable {
    
    var company : String
    var team : String
    var members : [Members]
}

struct Members : Codable {
    var name : String
    var age : Int?
    var location : String
    var github : String
    var hipo : Hipo
}

struct Hipo : Codable {
    var position : String
    var years_in_hipo : Int?
}
