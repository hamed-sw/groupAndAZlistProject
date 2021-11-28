//
//  ImageDownload.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 28.11.2021.
//

import UIKit

class DownloadImages {
    static var shared = DownloadImages()
    
    static var images = NSCache<NSString,NSData>()
    
    static func imageDownload(string: String, complition: @escaping (Data)->()) {
        guard let url = URL(string: string) else { return}
        
        if let imageData = images.object(forKey: url.absoluteString as NSString) {
            complition(imageData as Data)
            return
        }
        
        URLSession.shared.downloadTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                return }
            do {
                let theImage = try Data(contentsOf: data)
                self.images.setObject(theImage as NSData, forKey: url.absoluteString as NSString)
                complition(theImage)
            }catch {
                print(error)
            }
        }.resume()
        
    }
}
