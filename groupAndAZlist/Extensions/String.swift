//
//  String.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit
extension String {
    struct CellIdentifire {
        static var NasaCellCV: String { return "NasaCollectionViewCell"}
        static var galleryCell: String { return "GalleryTableViewCell"}
        static var azlistCell: String { return "AZListTableViewCell"}
        static var groupCell: String { return "GroupTableViewCell"}
    }
    
    struct StoryBoardIdentity {
        static var MainVC: String { return "MainViewController"}
        
    }
    struct ImageNames {
        static var nasaInfo: String { return "nasa_Info"}
        static var nasaTraval: String { return "traval"}
        static var rocetLaunch: String { return "launch"}
        static var nasaPlanetary: String { return "planetary"}
        static var nasaSpaceShip: String { return "nasa_spaceship"}
    }
    

    struct APIs {
        static var nasaAPI: String { return "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2021-08-04"}
    }
    
}
