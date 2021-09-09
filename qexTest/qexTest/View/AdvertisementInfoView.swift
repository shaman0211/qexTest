//
//  AdvertisementInfoView.swift
//  qexTest
//
//  Created by Artem  on 03.09.2021.
//

import UIKit

final class AdvertisementInfoView: UIView {
    private lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.text = "TestTestTestTestTestTestTest"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "Test"
        return label
    }()
    
    private lazy var dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupData(post: Post) {
        posterImage.image = post.poster
        titleLabel.text = post.name
        descriptionLabel.text = post.description
        dateOfCreationLabel.text = "Дата создания: \(post.createdAt)" 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let views = [posterImage, titleLabel, descriptionLabel, dateOfCreationLabel]
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            posterImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            posterImage.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 120),
        
            dateOfCreationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateOfCreationLabel.widthAnchor.constraint(equalTo: widthAnchor),
            dateOfCreationLabel.heightAnchor.constraint(equalToConstant: 40),
            dateOfCreationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
        ])
    }
    
}
