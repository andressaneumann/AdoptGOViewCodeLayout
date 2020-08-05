//
//  HomeViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
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
    
    //VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainBackgroundGrayColor

        setup()        
    }
}

extension HomeViewController: ViewConfigurator {
    
    func setupConstraints() {
        
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(60)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func setupViewHierarchy() {
        view.addSubview(welcomeLabel)
        view.addSubview(descriptionLabel)
    }
    
}
