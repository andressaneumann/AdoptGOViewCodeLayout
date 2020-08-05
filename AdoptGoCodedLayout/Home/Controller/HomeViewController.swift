//
//  HomeViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        let attributedText = NSMutableAttributedString(string: "Olá, ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), NSAttributedString.Key.foregroundColor: UIColor.primaryFontColor])
        
        attributedText.append(NSAttributedString(string: "usuário!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), NSAttributedString.Key.foregroundColor: UIColor.mainPurpleColor]))
        
        label.attributedText = attributedText

        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        let attributedText = NSMutableAttributedString(string: "Seu novo melhor amigo pode estar aqui!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.primaryFontColor])
        
        label.attributedText = attributedText
        
        return label
    }()
    
    //VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainBackgroundGrayColor
        
        
        setupLabels()
        setupLayout()
        
    }
    
    private func setupLabels() {
        view.addSubview(welcomeLabel)
        view.addSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }

}
