//
//  NotificationName.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

extension Notification.Name {
    static let galleryToAZListView = Notification.Name("galleryToAZListView")
    static let galleryToGroupView = Notification.Name("galleryToGroupView")
    static let aZlistToGalleryview = Notification.Name("aZlistToGalleryview")
    static let aZlistToGroupview = Notification.Name("aZlistToGroupview")
    static let groupToGalleryView = Notification.Name("groupToGalleryView")
    static let groupToAZlistView = Notification.Name("groupToAZlistView")
    static let NavigationBarHideFromDetailVC = Notification.Name("NavigationBarHideFromDetailVC")
    static let segmentGalleryOn = Notification.Name("segmentGalleryOn")
    static let segmentAZlsitOn = Notification.Name("segmentAZlsitOn")
    static let segmentGroupOn =  Notification.Name("segmentGroupOn")
    static let navigationHide = Notification.Name("navigationHide")
    static let enableNavigation = Notification.Name("enableNavigation")
    static let ipadCallSubgallery = Notification.Name("ipadCallSubgallery")
    
    
}
