//
//  BeerDetailViewController.swift
//  BeerRecommendNetwork
//
//  Created by 김재석 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerDetailViewController: UIViewController {

    // 맥주 이미지 영역
    @IBOutlet var beerImageView: UIImageView!
    
    // 맥주 이름, 정보를 위한 영역(스크롤 때문에 table view 사용ㅇ)
    @IBOutlet var beerTableView: UITableView!
    
    // 1. 받아올 데이터 양식으로 초기화
    var detailBeer: BeerModel = BeerModel(
        name: "",
        description: "",
        image_url: ""
    )
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
}

extension BeerDetailViewController {
    func configureView() {
        beerTableView.delegate = self
        beerTableView.dataSource = self
        
        // xib 연결
        let xib = UINib(
            nibName: "BeerDetailTableViewCell",
            bundle: nil
        )
        beerTableView.register(
            xib,
            forCellReuseIdentifier: "BeerDetailTableViewCell"
        )
        
        // 사진 연결
        let url = URL(string: detailBeer.image_url)
        beerImageView.kf.setImage(with: url)
    }
}

extension BeerDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BeerDetailTableViewCell",
            for: indexPath
        ) as! BeerDetailTableViewCell
        
        print(detailBeer)
        
        cell.setDataToTableCell(beerInfo: detailBeer)
        
        return cell
    }
    
    
}
