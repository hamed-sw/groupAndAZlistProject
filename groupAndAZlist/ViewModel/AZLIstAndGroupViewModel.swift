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
    var azLisArray = [String:DataModel]()
  //  let dddd = ["Hamed","Tamkin","Amta","Alyas","Ishaaq","Naved","Hamed","Ishaaq","Karima","Tamkin","Rafi","Bezhan","Haroon","","",""]
    
    func getData() {
        JsonParsing.apiCall { [weak self] data in
            switch data {
            case .success(let theData):
                self?.nasaDara = theData.compactMap({ DataModel(date: $0.date ?? "",
                                                                explanation: $0.explanation ?? "",
                                                                hdurl: $0.hdurl ?? "",
                                                                mediaType: $0.media_type ?? "",
                                                                serviceVersion: $0.service_version ?? "",
                                                                title: $0.title ?? "",
                                                                url: $0.url ?? "")
                    
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activeIndacater.stopAnimating()
                    self?.activeIndacater.hidesWhenStopped = true
                    self?.indicatorUIView.isHidden = true

 
                }
             
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func aZlistModel() {
        
        for user in nasaDara {
            let key = "\(user.title[user.title.startIndex])".uppercased()
            if var userValue = self.azLisArray[key] {
                print(userValue)
                print(azLisArray[key])
                
            }
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
