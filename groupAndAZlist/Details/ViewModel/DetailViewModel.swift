//
//  DetailViewModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class DetailViewModel {
    
    let db = Database()
    
    var inforArray = [DetailData]()
    var arrayCollection = [String]()

    
    func getDetail(id:String) {
        for user in db.getDetailData(id: id) {
            inforArray.append(DetailData(date: user.date,
                                         explanation: user.explanation,
                                         hdurl: user.hdurl,
                                         media_type: user.media_type,
                                         service_version: user.service_version,
                                         title: user.title,
                                         url: user.url,
                                         id: user.id))
        }
    }
    
    func imageDetailDisplay(str: String, cell: DetailCollectionViewCell) {
        DownloadImages.imageDownload(string: str) { data in
            guard let imageData = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                cell.detailImage.image = imageData
            }
        }
    }
    
    func getImageforCollection(id:String) {
        for user in db.getDetailData(id: id) {
            
            arrayCollection.append(user.hdurl!)
            arrayCollection.append(user.url!)
        }
    }
}
