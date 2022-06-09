//
//  TestCollectionViewController.swift
//  MaterialChipsAndMore
//
//  Created by Malhar Deshpande on 26/04/22.
//

import UIKit
import MaterialComponents.MDCChipView

class TestCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "Identifier"
    let chipViewPadding = CGFloat(12)
    let itemsPerRow: CGFloat = 2

    let dataSource = ["AETNA AETNA AETNA AETNA", "AETNA AETNA", "AETNA AETNA", "AETNA", "AETNA", "AETNA AETNA AETNA", "AETNA", "AETNA", "AETNA", "AETNA AETNA AETNA", "AETNA AETNA", "AETNA", "AETNA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(MDCChipCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        collectionView.frame = CGRect.zero
        //MARK: - CollectionInset

        let layout = MDCChipCollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.minimumInteritemSpacing = 7
        layout.minimumLineSpacing = 6
        
        //MARK: - Collection Inset
//
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 7
//        layout.minimumLineSpacing = 6
//        collectionView!.collectionViewLayout = layout
    }
}


extension TestCollectionViewController {
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MDCChipCollectionViewCell
        let chipView = cell.chipView
        cell.isUserInteractionEnabled = false
        chipView.titleLabel.text = dataSource[indexPath.row]
        chipView.setBackgroundColor(UIColor(named: "Background"), for: .normal)
        chipView.contentPadding = UIEdgeInsets(top: 0, left: CGFloat(chipViewPadding), bottom: 0, right: CGFloat(chipViewPadding))
        chipView.setInkColor(UIColor.green, for: .normal)
        chipView.setTitleColor(UIColor.white, for: .normal)
        chipView.titleLabel.font = UIFont.systemFont(ofSize: 16)
        chipView.invalidateIntrinsicContentSize()
        chipView.cornerRadius = 4
        return cell
    }
}

extension TestCollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
          let str = dataSource[indexPath.row]
          let font = UIFont.systemFont(ofSize: 16)
          let cellWidth = str.size(withAttributes: [.font: font]).width
          let paddingSpace = chipViewPadding * 4
          let totalCellWidth = paddingSpace + cellWidth
          return CGSize(width: totalCellWidth, height: 40)
      }

      // 3
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
          return UIEdgeInsets.zero
      }

      // This method controls the spacing between each line in the layout. You want this spacing to match the padding at the left and right.
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return 6
      }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
