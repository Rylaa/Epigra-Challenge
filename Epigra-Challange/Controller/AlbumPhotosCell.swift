//
//  AlbumPhotosCell.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 20.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class AlbumPhotosCell : UICollectionViewCell {
    // MARK: - Properties
    var url = URL(string: "")
    var albumText : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.frame = CGRect(x: 0,
                           y: 0,
                           width: UIScreen.main.bounds.size.width - 20.0,
                           height: .greatestFiniteMagnitude)
        
        lbl.sizeToFit()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font          = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    var Image: UIImageView = {
        var Img = UIImageView()
        Img.contentMode = .scaleAspectFit
        return Img
    }()
    // MARK: - Init
    var photoData : albumPhotoData? {
        didSet{
            albumText.text = photoData?.title
            if let thumbnailUrlImage =  photoData?.thumbnailUrl {
                Image.kf.setImage(with: URL(string: thumbnailUrlImage))
            }
        }
    }
    
    // MARK: - Handlers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(Image)
        Image.translatesAutoresizingMaskIntoConstraints = false
        Image.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        Image.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        Image.topAnchor.constraint(equalTo: topAnchor, constant: +20 ).isActive = true
        addSubview(albumText)
        albumText.translatesAutoresizingMaskIntoConstraints = false
        albumText.topAnchor.constraint(equalTo: Image.bottomAnchor, constant: +20).isActive = true
        
        albumText.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        albumText.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// this gives the height of the text
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
}
