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
    
    
    func startActiveIndicater() {
        activeIndacater.startAnimating()
    }
    func stopActiveIndicatter() {
        activeIndacater.stopAnimating()
    }
    
    func imageDisplay(str: String, cell: AZListTableViewCell ) {
        
        DownloadImages.imageDownload(string: str) { data in
            guard let imagedata = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                cell.azImage.image = imagedata
            }
        }
    }
}
