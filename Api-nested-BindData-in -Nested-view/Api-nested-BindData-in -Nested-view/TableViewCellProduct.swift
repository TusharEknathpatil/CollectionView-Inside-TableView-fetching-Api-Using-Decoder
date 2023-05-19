//
//  TableViewCellProduct.swift
//  Api-nested-BindData-in -Nested-view
//
//  Created by Mac on 19/05/23.
//

import UIKit

class TableViewCellProduct: UITableViewCell {

    var products:Product?
    @IBOutlet weak var imagess: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

extension TableViewCellProduct:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let productRemoveOptional = products else {
            print("Error")
            return 5
        }
        return productRemoveOptional.images.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellImage", for: indexPath) as? CollectionViewCellImage else {return UICollectionViewCell()}
        let arrayImages = URL(string: (products?.images[indexPath.row])!)
        collectionViewCell.imageOfProductd.kf.setImage(with: arrayImages)
        collectionViewCell.layer.cornerRadius = 10
        collectionViewCell.layer.borderWidth = 1
        collectionViewCell.layer.borderColor = UIColor.red.cgColor
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = (collectionView.frame.size.width-10)/2
        return CGSize(width: cell, height: cell)
    }
    
   
    
    
}
