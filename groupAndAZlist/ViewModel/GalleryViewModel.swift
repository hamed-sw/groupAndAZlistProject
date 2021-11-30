//
//  GalleryViewModel.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 29.11.2021.
//

import UIKit

class GalleryViewModel: NSObject {
    var galleryitem = [GalleryItem]()
    
    override init() {
        super .init()
        getGalleryItem()
    }
    func getGalleryItem() {
        galleryitem.append(GalleryItem(title: "Images", image: String.ImageNames.imageGallery, action: NasaGallery.ImageGallery ))
        galleryitem.append(GalleryItem(title: "Videos", image: String.ImageNames.videoImageGallery, action: NasaGallery.VideoGallery))
        
    }
    
    var subGalleryVideoArray = [VideoData]()
    var subGalleryImageArray = [ImageData]()
    let db = Database()
    
    func getVideo() {
        for user in db.getVideoData() {
            subGalleryVideoArray.append(VideoData(date: user.date,
                                                  explanation:user.explanation,
                                                  hdurl: user.hdurl,
                                                  media_type: user.media_type,
                                                  service_version: user.service_version,
                                                  title: user.title,
                                                  url: user.url,
                                                  id: user.id))
        }
        
    }
    
    func getImage() {
        
        for user in db.getImageData() {
            subGalleryImageArray.append(ImageData(date: user.date,
                                                  explanation:user.explanation,
                                                  hdurl: user.hdurl,
                                                  media_type: user.media_type,
                                                  service_version: user.service_version,
                                                  title: user.title,
                                                  url: user.url,
                                                  id: user.id))
        }
    }
    
    func imageDownload(str: String, cell:SubGalleryCollectionViewCell) {
        DownloadImages.imageDownload(string: str) { data in
            guard let imageData = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                cell.theImage.image = imageData
            }
        }
    }
    
}
