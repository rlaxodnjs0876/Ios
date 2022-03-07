//
//  ViewController.swift
//  FriendsCollection
//
//  Created by 김태원 on 2022/03/02.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let cellIdentifier:String = "cell"
    var friends:[Friend] = []
    @IBOutlet weak var collectionView : UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? FriendCollectionViewCell else{
             return UICollectionViewCell()
        }
        
        let friend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.addressLable.text = friend.fullAddress
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90)

        self.collectionView!.collectionViewLayout = flowLayout
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.collectionView!.reloadData()
    }
    
}

