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
                }
             
            case .failure(let error):
                print(error)
            }
        }
    }
}
