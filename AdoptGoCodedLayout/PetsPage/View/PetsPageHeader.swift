//
//  PetsPageHeader.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetsPageHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Pets"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = UIColor.primaryFontColor
        label.textAlignment = .center
        
        return label
    }()
    
    let amountOfPetsAvailable: UILabel = {
        let label = UILabel()
        
        label.text = "25 disponíveis"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.primaryFontColor
        label.textAlignment = .center
        
        return label
    }()
    
    //var searchController: UISearchController!
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, amountOfPetsAvailable])
        stackView.axis = .vertical
        stackView.spacing = 15
        //stackView.alignment = .center
        return stackView
    }()
}

extension PetsPageHeader: ViewConfigurator {
    func setupConstraints() {
        
           stackView.snp.makeConstraints { (make) in
               make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
               make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
               make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
           }
    }
    
    func setupViewHierarchy() {
        addSubview(stackView)
    }    
}
