//
//  PetsPageCollectionViewCell.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetsPageCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        //imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let breedLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .primaryFontColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .primaryFontColor
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .primaryFontColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .primaryFontColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        return label
    }()
    
    lazy var nameAndGenderContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, genderLabel])

        stackView.axis = .horizontal

        return stackView
    }()

    lazy var descriptionContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameAndGenderContainer, breedLabel, ageLabel])

        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        return stackView
    }()

    lazy var viewCellContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, descriptionContainer])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.axis = .horizontal

        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with pet: Pet) {
        imageView.image = UIImage(named: pet.imagePath)
        breedLabel.text = pet.breed
        nameLabel.text = pet.name
        genderLabel.text = pet.gender.rawValue
        ageLabel.text = "1 year"
        
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
}

extension PetsPageCollectionViewCell: ViewConfigurator {
    func setupConstraints() {
        
        viewCellContainer.snp.makeConstraints { (make) in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupViewHierarchy() {
        addSubview(viewCellContainer)
    }    
}
