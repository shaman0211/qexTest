//
//  ViewController.swift
//  qexTest
//
//  Created by Artem  on 01.09.2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    var posts = [Post]()
    
    let networkService: NetworkServiceProtocol
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 360, height: 460)
        return layout
    }()
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.register(AdvertisementCell.self,
                                forCellWithReuseIdentifier: AdvertisementCell.identifier)
        getAdd()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAdd() {
        networkService.getPosts { result in
            self.posts = result.posts
            self.getImage(posts: self.posts)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func getImage(posts: [Post]) {
        for (index, post) in posts.enumerated() {
            networkService.getPostImage(photo: post.photo) { data in
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.posts[index].poster = image
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
}


extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.identifier, for: indexPath) as? AdvertisementCell
        cell?.setupData(post: posts[indexPath.item])
        return cell ?? UICollectionViewCell()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = AdvertisementInfoController(post: posts[indexPath.item])
        present(viewController, animated: true, completion: nil)
    }
    
}

