//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by PM on 19/07/2021.
//

import Foundation

struct BusinessSearch: Decodable{
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
