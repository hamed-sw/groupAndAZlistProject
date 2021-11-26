//
//  Model.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit
//["nasa_info","traval","launch","planetary","nasa_spaceship"]

enum NasaAction {
    case  NASA_INFO, TRAVAL, ROCKETLAUNC, NASA_PLANETARY, SPACESHIP
}


struct NasaItem {
    var title: String
    var image: String
    var action: NasaAction
}
