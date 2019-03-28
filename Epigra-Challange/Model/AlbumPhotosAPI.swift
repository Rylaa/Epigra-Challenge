//
//  AlbumPhotosAPI.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import Alamofire


class AlbumsPhotosAPI {
    
    // MARK: - Properties
    static let shared = AlbumsPhotosAPI()
    
    // MARK: - Networking
    func getAlbumPhotos( userId : Int? ,ret: @escaping (_ albumPhotoDT: albumPhotoData?) -> ()){
        // get json data
        if let userID = userId {
            AF.request("https://jsonplaceholder.typicode.com/photos?albumId="+"\(userID)").responseJSON { response in
                // API result
                switch response.result {
                case .success :
                    do {
                        // Parsing Json
                        let Json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableLeaves)
                        guard let jsonDic = Json as? [[String:Any]] else { return }
                        for val in jsonDic {
                           ret(albumPhotoData(val: val))
                        }
                        print(jsonDic.count)
                        
                    } catch {
                        print("Json parsing Error")
                    }
                case .failure : print("Error loading")
                }
            }
        }
    }
}
