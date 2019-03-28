//
//  AlbumPhotosData.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

// MARK: - Export Json values by id 
struct albumPhotoData {
    var thumbnailUrl : String?
    var id           : Int?
    var albumId      : Int?
    var url          : String?
    var title        : String?
    
    
    init?(val: [String:Any]) {
        guard
            let thumbnailUrl  = val["thumbnailUrl"] as? String,
            let id            = val["id"] as? Int,
            let albumId       = val["albumId"] as? Int,
            let url           = val["url"] as? String,
            let title         = val["title"] as? String
            
            
            else { return nil }
        self.thumbnailUrl   = thumbnailUrl
        self.id             = id
        self.albumId        = albumId
        self.url            = url
        self.title          = title
        
       
    }
    
    
}
