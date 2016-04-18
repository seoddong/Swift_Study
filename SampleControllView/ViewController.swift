//
//  ViewController.swift
//  SampleControllView
//
//  Created by SeoDongHee on 2016. 4. 17..
//  Copyright © 2016년 SeoDongHee. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "Cell"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 1. Collection View를 제어하기 위해 Collection View를 연결한다.
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: PHFetchResult!
    let imageManager = PHCachingImageManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.1 아래 delegate와 dataSource를 self로 지정하지 않으면 화면에 표현되지 않는다.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 2. Controll View에서 사용할 데이터 준비
        images = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 3. Collection View에서 사용할 핵심 메소드 정의
    // 3.1. Ceollection View에서 각 Cell을 정의할 메소드를 정의
    //      이 Method는 UICollectionViewDataSource에 정의되어 있으므로 이 놈을 꼭 상속해야 한다.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CollectionViewCell {
            
            cell.imageManager = imageManager
            cell.imageAsset = images[indexPath.item] as? PHAsset
            
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    // 3.2 Cell을 선택했을 때 호출되는 메소드
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // 나중에 정의
    }
    
    // 3.3 이 Collection View의 Cell이 몇 개인지 정의
    //     역시 이 메소드도 UICollectionViewDataSource를 상속해야 사용 가능하다.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 이 샘플에서는 images의 개수가 cell의 개수이다.
        return images.count
    }
    
    // 3.4 이 Collection View의 Section이 몇 개이니 정의
    //     역시 이 메소드도 UICollectionViewDataSource를 상속해야 사용 가능하다.
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        // 이 샘플에서는 Section은 1개이다.
        return 1
    }
    
    // 4. Collection View에서 사용할 부가적인 메소드 정의
    // 4.1. Ceollection View에서 각 Cell의 디자인을 정의할 메소드를 정의
    //      이 Method는 UICollectionViewDelegateFlowLayout에 정의되어 있으므로 이 놈을 꼭 상속해야 한다.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        // 이 샘플에서는 Cell의 크기를 105x105로 지정한다.
        return CGSizeMake(105, 105)
    }


}

