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
        static var headerIdentifier: String { return "header"}
        static var SubGalleryCell: String { return "SubGalleryCollectionViewCell"}
        static var detailImageCell: String { return "DetailImageTableViewCell"}
        static var detailExplanationCell: String { return "DetailExplanationTableViewCell"}
        static var detailCollectionCell: String { return "DetailCollectionViewCell"}
    }
    
    struct StoryBoardIdentity {
        static var MainVC: String { return "MainViewController"}
        static var detailVC: String { return "DetailViewController"}
        
    }
    struct ImageNames {
        static var nasaInfo: String { return "nasa_Info"}
        static var nasaTraval: String { return "traval"}
        static var rocetLaunch: String { return "launch"}
        static var nasaPlanetary: String { return "planetary"}
        static var nasaSpaceShip: String { return "nasa_spaceship"}
        static var videoImageGallery: String { return "video"}
        static var imageGallery: String { return "images"}
    }
    

    struct APIs {
        static var nasaAPI: String { return "" } //"https://api.nasa.gov/planetary/apod?api_key=iTpU7k38bGEuZyRNhiTPxmheejpSqg5BQi5rgGQX&start_date=2021-08-04"}
    }
    
}
