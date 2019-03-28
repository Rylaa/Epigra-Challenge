//
//  AlbumsData.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

// Mark: - Importing Json Values *
struct AlbumsData {
    
    var userId: Int?
    var id: Int?
    var title: String?
    
    //    init(userid : Int, id : Int, tit : String){
    //        self.userId = userid
    //        self.id = id
    //        self.title = tit
    //    }
    //
    init?(val: [String:Any]){
        guard
            let userId      = val["userId"] as? Int,
            let id          = val["id"] as? Int,
            let title       = val["title"] as? String
            else {
                return nil
        }
        self .userId = userId
        self .id     = id
        self .title  = title
        
    }
    
    
}


