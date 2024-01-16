//
//  BeerRecommendCollectionViewCell.swift
//  BeerRecommendNetwork
//
//  Created by 김재석 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerRecommendCollectionViewCell: UICollectionViewCell {

    @IBOutlet var beerImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        titleLabel.textAlignment = .center
        titleLabel.text = "잠시만 기다려 주세요"
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.numberOfLines = 0
        
//        contentLabel.textAlignment = .center
        contentLabel.font = .systemFont(ofSize: 13)
        contentLabel.numberOfLines = 0
        contentLabel.text = ""
    }
    
    func settingData(beerInfo: BeerModel) {
        let imgUrl = URL(string: beerInfo.image_url)
        beerImageView.kf.setImage(with: imgUrl)
        beerImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = beerInfo.name
        contentLabel.text = beerInfo.description
    }
}
