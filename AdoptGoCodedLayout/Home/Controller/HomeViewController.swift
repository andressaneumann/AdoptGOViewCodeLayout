//
//  HomeViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UICollectionViewController {
    
    let petList = PetDAO().returnPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        
        collectionView.backgroundColor = UIColor.mainBackgroundGrayColor
        
        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerIdentifier")

        collectionView.register(PetCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PetCollectionViewCell

        let pet = petList[indexPath.item]

        cell.setupCell(with: pet)

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerIdentifier", for: indexPath)

        return header
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 2) - 20
        return CGSize(width: cellWidth, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ControllerViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        
        let nav = UINavigationController(rootViewController: HomeViewController())
        
        return nav.view!
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

@available(iOS 13.0, *)
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ControllerViewRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")

            ControllerViewRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone Pro Max"))
                .previewDisplayName("iPhone Pro Max")

            ControllerViewRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone Pro"))
                .previewDisplayName("iPhone Pro")
        }
    }
}
#endif
