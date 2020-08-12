//
//  PetsViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetsPageViewController: UICollectionViewController {
    
    let petList = PetDAO().returnPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pets"
        collectionView.backgroundColor = UIColor.mainBackgroundGrayColor
        
        collectionView.register(PetsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "petsHeaderIdentifier")
        
        collectionView.register(PetsPageCollectionViewCell.self, forCellWithReuseIdentifier: "petCellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "petsHeaderIdentifier", for: indexPath)
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "petCellId", for: indexPath) as! PetsPageCollectionViewCell
        
        let pet = petList[indexPath.item]

        cell.setupCell(with: pet)

        return cell
    }
}

extension PetsPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width

        return CGSize(width: cellWidth, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
}
