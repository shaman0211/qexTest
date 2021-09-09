//
//  AdvertisementInfo.swift
//  qexTest
//
//  Created by Artem  on 03.09.2021.
//

import UIKit

final class AdvertisementInfoController: UIViewController {
    
    private let post: Post
    
    lazy var advertisementView: AdvertisementInfoView = {
        let view = AdvertisementInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(advertisementView)
        view.backgroundColor = .white
        setupView()
        advertisementView.setupData(post: post)
    }
    
    func setupView() {
        view.addSubview(advertisementView)
        
        NSLayoutConstraint.activate([
            advertisementView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            advertisementView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            advertisementView.heightAnchor.constraint(equalTo: view.heightAnchor),
            advertisementView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}
