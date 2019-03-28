//
//  AlbumDetailVC.swift
//  Epigra-Challange
//
//  Created by Yusuf DEMİRKOPARAN on 21.03.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// SELECTED OLANI DİREK ÇEK
class AlbumDetailVC : UIViewController {
    
    // MARK: - Properties
    var imgUrl      : String?
    var imgTitle    : String?
    var Text        : UILabel = {
        var lbl             = UILabel()
        lbl.font            = UIFont.systemFont(ofSize: 20)
        lbl.textColor       = .white
        lbl.textAlignment   = .center
        lbl.numberOfLines   = 0
        lbl.sizeToFit()
        return lbl
    }()
    var Img         : UIImageView = {
        var image         = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.blue,
             NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 22)]
        self.title = "Details"
    }
    
    func setupLayout() {
        
        
        Img.kf.setImage(with: URL(string:imgUrl!))
        Img.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Img)
        Img.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant : -50).isActive = true
        Img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Img.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        Img.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        

        Text.text = imgTitle
        Text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Text)
        Text.topAnchor.constraint(equalTo: Img.bottomAnchor).isActive = true
        Text.heightAnchor.constraint(equalToConstant: (Text.text?.height(constraintedWidth: UIScreen.main.bounds.size.width, font: UIFont.systemFont(ofSize: 20)))!*2).isActive = true
        Text.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        Text.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    // MARK: - Handlers
    
}
