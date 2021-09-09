//
//  AdvertismentCell.swift
//  qexTest
//
//  Created by Artem  on 01.09.2021.
//

import UIKit

final class AdvertisementCell: UICollectionViewCell {
    
    static let identifier = "AdvertisementCell"
    
    private lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.text = "TestTestTestTestTestTestTest"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        layer.cornerRadius = 22
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.masksToBounds = true
    }
    
    func setupData(post: Post) {
        titleLabel.text = post.name
        descriptionLabel.text = post.description
        posterImage.image = post.poster
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let views = [posterImage, titleLabel, descriptionLabel]
        views.forEach {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImage.widthAnchor.constraint(equalTo: widthAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 300),
            posterImage.topAnchor.constraint(equalTo: topAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 120)
        
        ])
    }
}
