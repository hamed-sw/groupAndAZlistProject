////
////  AZlistViewModel.swift
////  groupAndAZlist
////
////  Created by Hamed Amiry on 28.11.2021.
////
//
//import UIKit
//
//class AZListViewModel {
//    
// """
//    let db = Database()
//    var userSection = [String]()
//    var userDictionary = [String:[Catagory]]()
//    var aZListUserDictionary = [String:[AZList]]()
//    var searchfileIn = [SearchData]()
//    var filterData = [SearchData]()
//    var isAppend:Bool = true
//    
//    
//    func aZListSorting() {
//        for user in db.aZListData() {
//
//            isAppend = true
//    
//            let key = "\(user.title_english[user.title_english.startIndex])".uppercased()
//
//            if  var userValue = self.aZListUserDictionary[key] {
//                for (elemen,_) in userValue.enumerated() {
//                    if user.title_english == userValue[elemen].title_english {
//
//                        userValue[elemen].addElement(task: user)
//                        aZListUserDictionary[key] = userValue
//
//                        isAppend = false
//                    }
//                }
//                if isAppend {
//
//                    userValue.append(AZList(latin: user.latin, title: user.title, title_english: user.title_english, imagename: user.filename, monoId: user.monographs_id, sectionImage: [user]))
//               
//                    aZListUserDictionary[key] = userValue
//
//                }
//                
//            } else {
//                self.aZListUserDictionary[key] = [AZList(latin: user.latin, title: user.title, title_english: user.title_english, imagename: user.filename, monoId: user.monographs_id, sectionImage: [user])]
//            }
//            self.userSection = [String](self.aZListUserDictionary.keys).sorted()
//        }
//    }
//
//    var userSections: [String] {
//        return userSection
//    }
//    
//    var userDictionaries: [String:[Catagory]] {
//        return userDictionary
//    }
//    
//    //return total count
//    var userCount: Int {
//        return db.dataa().count
//    }
//    
//    func searchFile() {
//        for user in db.searchingData() {
//            searchfileIn.append(SearchData(monographs_id: user.monographs_id,
//                                           imagename: user.imagename,
//                                           title: user.title,
//                                           latin: user.latin,
//                                           title_english: user.title_english))
//        }
//    }
//    """
//}
//
//
