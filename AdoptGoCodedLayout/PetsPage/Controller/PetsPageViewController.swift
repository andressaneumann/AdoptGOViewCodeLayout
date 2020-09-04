//
//  PetsViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetsPageViewController: UICollectionViewController {
    
    lazy var petList = allPets
    let allPets = PetDAO().returnPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pets"
        collectionView.backgroundColor = UIColor.mainBackgroundGrayColor
        
        collectionView.register(PetsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "petsHeaderIdentifier")
        
        collectionView.register(PetsPageCollectionViewCell.self, forCellWithReuseIdentifier: "petCellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "petsHeaderIdentifier", for: indexPath) as? PetsPageHeader else { return UICollectionReusableView() }
        
        header.amountOfPetsAvailable.text = "\(petList.count) disponíveis"
        header.searchBar.delegate = self
        
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
        let cellWidth = collectionView.bounds.width - 32

        return CGSize(width: cellWidth, height: 118)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

}

extension PetsPageViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        petList = allPets.filter({ (pet) -> Bool in
            var searchText = searchBar.text ?? ""
            return pet.name.contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines))
        })
        
        if petList.isEmpty {
            petList = allPets
        }
        
        collectionView.reloadData()
    }
    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        petList = allPets.filter({ (pet) -> Bool in
//            var searchText = searchBar.text ?? ""
//            return pet.name.contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines))
//        })
//
//        if petList.isEmpty {
//            petList = allPets
//        }
//
//        collectionView.reloadData()
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            petList = allPets
            collectionView.reloadData()
        }
    }
    
}
