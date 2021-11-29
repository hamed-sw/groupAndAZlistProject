//
//  DataModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 27.11.2021.
//

import Foundation

struct DataModel {
    var date: String
    var explanation: String
    var hdurl: String
    var mediaType: String
    var serviceVersion: String
    var title: String
    var url: String
    var id: String
}

struct GroupData {
    var isActive:Bool
    var mediaType: String
    var section:[DataModel]
}
