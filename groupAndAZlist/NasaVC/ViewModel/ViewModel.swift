//
//  ViewModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class ViewModel: NSObject {
    var items = Bindable<[NasaItem]>()
    
    override init() {
        super.init()
        getNasaItem()
        
    }
    
    func getNasaItem() {
        var theItem = [NasaItem]()
        theItem.append(NasaItem(title: "Nasa Info", image: String.ImageNames.nasaInfo, action: NasaAction.NASA_INFO))
        theItem.append(NasaItem(title: "Traval To", image: String.ImageNames.nasaTraval, action: NasaAction.TRAVAL))
        theItem.append(NasaItem(title: "Rocket Launch", image: String.ImageNames.rocetLaunch, action: NasaAction.ROCKETLAUNC))
        theItem.append(NasaItem(title: "Planetary", image: String.ImageNames.nasaPlanetary, action: NasaAction.NASA_PLANETARY))
        theItem.append(NasaItem(title: "Space Ship", image: String.ImageNames.nasaSpaceShip, action: NasaAction.SPACESHIP))
        self.items.value = theItem
    }
}
