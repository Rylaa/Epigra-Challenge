//
//  AlbumsAPI.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AlbumsAPI {
    // MARK: - Properties
    let albumJSON = "https://jsonplaceholder.typicode.com/albums"
    static let shared = AlbumsAPI()
    
    // MARK: - Networking 
    func getAlbums(ret: @escaping (_ abumDT: AlbumsData?) -> ()){
        // get json data
        AF.request( albumJSON, method: .get, parameters: nil).responseJSON { response in
            //result
            switch response.result {
            case .success:
                do{
                    // Parsing Json
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableLeaves)
                    guard let jsonVal = json as? [[String:Any]] else { return }
                    for value in jsonVal {
                        ret(AlbumsData(val: value))
                    }
                } catch {
                    print("Json parsing Error!")
                }
            case .failure:
                print("Error loading")
            }
        }
    }
}
