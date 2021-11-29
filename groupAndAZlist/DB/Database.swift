//
//  Database.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 28.11.2021.
//

import Foundation
import FMDB

class Database {
   // let url = ConnectionDB.fileUrl
    let database = FMDatabase(url: fileUrl)
    
    func dbMethod() {
        guard database.open() else {
            print("unable to open database")
            return
        }
        do {
            try database.executeUpdate("CREATE TABLE IF NOT EXISTS NASA_PLANETARY(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, explanation TEXT, hdurl TEXT, media_type TEXT, service_version TEXT, title TEXT, url TEXT)", values: nil)
        } catch {
            print("\(error.localizedDescription)")
        }
        database.close()
    }
    
    func insertFromUrl(date:String,explanation:String,hdurl:String,media_type:String,service_version:String,title:String,url:String) {
        guard database.open() else {
            print("unable to open database")
            return
        }
        do {

            try database.executeUpdate("INSERT INTO NASA_PLANETARY(date,explanation,hdurl,media_type,service_version,title,url) values (?,?,?,?,?,?,?)", values: [date,explanation,hdurl,media_type,service_version,title,url])
        }catch {
            print("\(error.localizedDescription)")
        }
        database.close()
    }

    
    func getData() -> [DataModel] {
        var maindata = [DataModel]()
        let database = FMDatabase(url: fileUrl)
        if  database.open() {
            do {
                let rs = try database.executeQuery("SELECT * from  NASA_PLANETARY", values: nil)
                while rs.next() {
                    let item = DataModel(date: rs.string(forColumn: "date") ?? "",
                                         explanation: rs.string(forColumn: "explanation") ?? "",
                                         hdurl: rs.string(forColumn: "hdurl") ?? "",
                                         mediaType: rs.string(forColumn: "media_type") ?? "",
                                         serviceVersion: rs.string(forColumn: "service_version") ?? "",
                                         title: rs.string(forColumn: "title") ?? "",
                                         url: rs.string(forColumn: "url") ?? "")
                    maindata.append(item)
                }
            }catch {
                print(error.localizedDescription)
            }
        } else {
            print("sorry unable to open data")
            return []
        }
        database.close()
        return maindata
    }
    func getImageData() -> [ImageData] {
        var maindata = [ImageData]()
        let database = FMDatabase(url: fileUrl)
        if  database.open() {
            do {
                let rs = try database.executeQuery("SELECT * from NASA_PLANETARY where media_type = 'image'", values: nil)
                while rs.next() {
                    let item = ImageData(date: rs.string(forColumn: "date") ?? "",
                                         explanation: rs.string(forColumn: "explanation") ?? "",
                                         hdurl: rs.string(forColumn: "hdurl") ?? "",
                                         media_type: rs.string(forColumn: "media_type") ?? "",
                                         service_version: rs.string(forColumn: "service_version") ?? "",
                                         title: rs.string(forColumn: "title") ?? "",
                                         url: rs.string(forColumn: "url") ?? "")
                    maindata.append(item)
                }
            }catch {
                print(error.localizedDescription)
            }
        } else {
            print("sorry unable to open data")
            return []
        }
        database.close()
        return maindata
    }
    func getVideoData() -> [VideoData] {
        var maindata = [VideoData]()
        let database = FMDatabase(url: fileUrl)
        if  database.open() {
            do {
                let rs = try database.executeQuery("SELECT * from NASA_PLANETARY where media_type = 'video'", values: nil)
                while rs.next() {
                    let item = VideoData(date: rs.string(forColumn: "date") ?? "",
                                         explanation: rs.string(forColumn: "explanation") ?? "",
                                         hdurl: rs.string(forColumn: "hdurl") ?? "",
                                         media_type: rs.string(forColumn: "media_type") ?? "",
                                         service_version: rs.string(forColumn: "service_version") ?? "",
                                         title: rs.string(forColumn: "title") ?? "",
                                         url: rs.string(forColumn: "url") ?? "")
                    maindata.append(item)
                }
            }catch {
                print(error.localizedDescription)
            }
        } else {
            print("sorry unable to open data")
            return []
        }
        database.close()
        return maindata
    }
}


