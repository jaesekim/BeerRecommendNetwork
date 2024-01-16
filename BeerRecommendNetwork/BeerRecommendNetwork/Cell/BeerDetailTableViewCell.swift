//
//  BeerDetailTableViewCell.swift
//  BeerRecommendNetwork
//
//  Created by 김재석 on 1/16/24.
//

import UIKit

class BeerDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        contentLabel.font = .systemFont(ofSize: 13)
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
    }

    func setDataToTableCell(beerInfo: BeerModel) {
        titleLabel.text = beerInfo.name
        contentLabel.text = beerInfo.description
    }
    
    
}
