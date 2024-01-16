//
//  BeerRecommendViewController.swift
//  BeerRecommendNetwork
//
//  Created by 김재석 on 1/16/24.
//

import UIKit

class BeerRecommendViewController: UIViewController {

    @IBOutlet var beerCollectionView: UICollectionView!
    
    // api 통신으로 받아올 데이터를 저장할 빈 리스트
    var beerInfoList: [BeerModel] = [] {
        didSet {
            beerCollectionView.reloadData()
        }
    }
    
    // api 관리 객체 생성
    let apiManager = BeerAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setLayout()
        apiManager.getBeerInfo { value in
            self.beerInfoList = value
        }
    }

}

extension BeerRecommendViewController {
    func configureView() {
        navigationItem.title = "오늘의 맥주"
        
        beerCollectionView.delegate = self
        beerCollectionView.dataSource = self
        
        // xib 연결
        let xib = UINib(
            nibName: "BeerRecommendCollectionViewCell",
            bundle: nil
        )
        beerCollectionView.register(
            xib,
            forCellWithReuseIdentifier: "BeerRecommendCollectionViewCell"
        )
    }
    
    func setLayout() {
        // layout 객체생성
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let cellWidth: CGFloat = (UIScreen.main.bounds.width - spacing * 3) / 2
        let cellHeight: CGFloat = cellWidth * 1.4
        // layout 세부 설정
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: 5, bottom: spacing, right: 5)
        layout.minimumLineSpacing = spacing
        
        // layout 적용
        beerCollectionView.collectionViewLayout = layout
    }
}

extension BeerRecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerInfoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BeerRecommendCollectionViewCell",
            for: indexPath
        ) as! BeerRecommendCollectionViewCell
        
        cell.settingData(beerInfo: beerInfoList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "BeerDetailViewController") as! BeerDetailViewController
        
        // 2. 값 전달
        print(beerInfoList[indexPath.row])
        vc.detailBeer = beerInfoList[indexPath.row]
        
        // modal 띄우기
        present(vc, animated: true)
        
    }
    
}
