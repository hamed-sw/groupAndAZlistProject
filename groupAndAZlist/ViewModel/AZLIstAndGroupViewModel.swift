//
//  AZLIstAndGroupViewModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 27.11.2021.
//

import UIKit

class AZlistAndGroupViewModel {
    
    var tableView = UITableView()
    var nasaDara = [DataModel]()
    var activeIndacater = UIActivityIndicatorView()
    var indicatorUIView = UIView()
    var azLisDic = [String:[DataModel]]()
    var userSection = [String]()
   // var nasaArray = []()
    let db = Database()

//    func getData() {
//        JsonParsing.apiCall { [weak self] data in
//            switch data {
//            case .success(let theData):
////                self?.nasaDara = theData.compactMap({ DataModel(date: $0.date ?? "",
////                                                                explanation: $0.explanation ?? "",
////                                                                hdurl: $0.hdurl ?? "",
////                                                                mediaType: $0.media_type ?? "",
////                                                                serviceVersion: $0.service_version ?? "",
////                                                                title: $0.title ?? "",
////                                                                url: $0.url ?? "", id: $0.id ?? "")
////
////
////                })
//
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                    self?.activeIndacater.stopAnimating()
//                    self?.activeIndacater.hidesWhenStopped = true
//                    self?.indicatorUIView.isHidden = true
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func getdatafromDatabase() {
        for user in db.getData() {
            nasaDara.append(DataModel(date: user.date, explanation: user.explanation, hdurl: user.hdurl, mediaType: user.mediaType, serviceVersion: user.serviceVersion, title: user.title, url: user.url, id: user.id))
        }
    }
    
    func aZlistModel() {
        
        for user in db.getData() {
//            var key:String
//            for n in user.title {
//                if n == String{
//                    
//                }
//            }
            let key = "\(user.title[user.title.startIndex])".uppercased()
           // print(user)
         //  print(key)
            if var userValue = self.azLisDic[key] {
                userValue.append(user)
                //print(userValue)
                azLisDic[key] = userValue

            }else {
                self.azLisDic[key] = [user]
               // print(azLisDic)
            }
            self.userSection = [String](self.azLisDic.keys).sorted()
        }
        
    }
    
    
    
    func startActiveIndicater() {
        activeIndacater.startAnimating()
    }
    func stopActiveIndicatter() {
        activeIndacater.stopAnimating()
    }
    
    func imageDisplayAZlist(str: String, cell: AZListTableViewCell ) {
        
        DownloadImages.imageDownload(string: str) { data in
            guard let imagedata = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                cell.azImage.image = imagedata
            }
        }
    }
    func imageDisplayGroup(str: String, cell:GroupTableViewCell) {
        DownloadImages.imageDownload(string: str) { data in
            guard let imageData = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                cell.groupImage.image = imageData
            }
        }
    }
}
