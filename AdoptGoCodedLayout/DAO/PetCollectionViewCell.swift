//
//  PetCollectionViewCell.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let breedLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, genderLabel])
        
        return stackView
    }()
    
    lazy var containerStack: UIStackView = {
        let containerStackView = UIStackView(arrangedSubviews: [breedLabel, stackView])
        containerStackView.axis = .vertical
        containerStackView.alignment = .leading
        return containerStackView
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
    }
}

extension PetCollectionViewCell: ViewConfigurator {
    func setupConstraints() {
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        containerStack.snp.makeConstraints { (make) in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(containerStack)
    }
}
