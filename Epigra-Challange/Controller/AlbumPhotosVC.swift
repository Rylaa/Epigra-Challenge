//
//  AlbumPhotosVC.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 19.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
class AlbumPhotosVC : UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    
    
    // MARK: - Properties 
    var selectedAlbumID : Int?
    let cellID = "cellId"
    var AlbumPhotoDt = [albumPhotoData]()
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    private let itemsPerRow: CGFloat = 2
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = self.collectionView.bounds
        collectionView.layer.insertSublayer(gradientLayer, at: 0)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .black
        collectionView.collectionViewLayout.invalidateLayout()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.blue,
             NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        self.title = "Albums Photos"
        getDataById()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.register(AlbumPhotosCell.self, forCellWithReuseIdentifier: cellID)
    }
    // MARK: - Handlers
    
    func getDataById() {
        AlbumsPhotosAPI.shared.getAlbumPhotos(userId: selectedAlbumID ) { (albumPhotoData) in
            if let Data = albumPhotoData {
                self.AlbumPhotoDt.append(Data)
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AlbumPhotosCell
        cell.photoData = AlbumPhotoDt[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumPhotoDt.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let albumDetail = AlbumDetailVC()
        albumDetail.imgTitle = AlbumPhotoDt[indexPath.row].title
        albumDetail.imgUrl = AlbumPhotoDt[indexPath.row].url
        navigationController?.pushViewController(albumDetail, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Check device orientation
        // Column number identification
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        if UIDevice.current.orientation.isLandscape {
            let widthPerItem = availableWidth / (itemsPerRow+2)
            return CGSize(
                width: widthPerItem,
                height: (AlbumPhotoDt[indexPath.row].title?.height(
                    constraintedWidth: widthPerItem,
                    font: UIFont.systemFont(ofSize: 20)))!+widthPerItem+7)
        } else {
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(
                width: widthPerItem,
                height: (AlbumPhotoDt[indexPath.row].title?.height(
                    constraintedWidth: widthPerItem,
                    font: UIFont.systemFont(ofSize: 20)))!+widthPerItem+7)
        }
    }
    
    // Resizing flowlayout
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: { _ in self.collectionView.collectionViewLayout.invalidateLayout() },
            completion: { _ in }
        )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}


