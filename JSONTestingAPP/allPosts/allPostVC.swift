//
//  ViewController.swift
//  JSONTestingAPP
//
//  Created by Muhammad Kalim on 14/11/2019.
//  Copyright © 2019 DHA. All rights reserved.
//

import UIKit


class allPostVC: UIViewController {
    
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        allPost()
    }
    
    
    
    
    func allPost(){
        requestManager.instance.allPosts { (success, error) in
            if success != nil {
                Api.params.allPosts.append(contentsOf: success!)
            }
            self.collectionView.reloadData()
        }
    }


}

extension allPostVC : UICollectionViewDelegate {
    
}

extension allPostVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Api.params.allPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! allPostCell
        cell.postBodyLbl.text = Api.params.allPosts[indexPath.row].body
        cell.postTitleLbl.text = Api.params.allPosts[indexPath.row].title
        cell.postSerialLbl.text = String(Api.params.allPosts[indexPath.row].id)
        return cell
    }
    
    
}

extension allPostVC : UICollectionViewDelegateFlowLayout{
    
}

