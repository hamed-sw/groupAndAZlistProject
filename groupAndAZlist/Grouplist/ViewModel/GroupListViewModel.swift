//
//  GroupListViewModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 28.11.2021.
//

import UIKit

class GroupListViewModel {
    
    var groupArryData = [GroupData]()
    let db = Database()
    var Active:Bool = true
    
    func fetchData() {
        for user in db.getData() {
            
            if groupArryData.isEmpty {
                groupArryData.append(GroupData(isActive: false, mediaType: user.mediaType, section: [user]))
            } else {
                Active = true
                for (n,_) in groupArryData.enumerated() {
                    if user.mediaType == groupArryData[n].mediaType {
                        groupArryData[n].section.append(user)
                        Active = false

                    }
                }
                if Active {
                    groupArryData.append(GroupData(isActive: false, mediaType: user.mediaType, section: [user]))
                }
            }
        }
    }
    
//    func updateImage(str:String){
//        DownloadImages.imageDownload(string: str) { [weak self] data in
//            guard let image = UIImage(data: data) else { return}
//            DispatchQueue.main.async {
//                <#code#>
//            }
//        }
//    }
    
}
