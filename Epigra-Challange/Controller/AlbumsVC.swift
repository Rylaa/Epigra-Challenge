//
//  AlbumsVC.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AlbumsVC : UITableViewController {
    
    
    // MARK: - Properties
    let cellId = "cellId"
    var AlbumsDt = [AlbumsData]()
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = AlbumsDt.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 0.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
    
    // Mark: - TableView Properties
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlbumsDt.count
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .clear
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        cell.textLabel?.text = AlbumsDt[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    // MARK: - Init *
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.blue,
             NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 22)]
        self.title = "Albums"
        
        tableViewGetData()
    }
    

 
    // MARK: - Handlers
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        let layout = UICollectionViewFlowLayout()
        let albumPhotoVC = AlbumPhotosVC(collectionViewLayout: layout)
        albumPhotoVC.selectedAlbumID = AlbumsDt[indexPath.row].userId
        if albumPhotoVC.selectedAlbumID != nil {
            navigationController?.pushViewController(albumPhotoVC, animated: true)
        }
    }
    
    
    func tableViewGetData() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        // Entering data into the tableview
        AlbumsAPI.shared.getAlbums { (Data) in
            if let albumResData = Data {
                self.AlbumsDt.append(albumResData)
                self.tableView.reloadData()
            }
        }
    }
    
}


