//
//  HomeHeader.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        
        label.attributedText = NSMutableAttributedString().normal("Olá, ", 30, .primaryFontColor).bold("usuário!", 30, .mainPurpleColor)

        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()

        let attributedText = NSMutableAttributedString(string: "Seu novo melhor amigo pode estar aqui!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.primaryFontColor])
        
        label.attributedText = attributedText
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeHeader: ViewConfigurator {
    
    func setupViewHierarchy() {
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(60)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
    }
    
}
