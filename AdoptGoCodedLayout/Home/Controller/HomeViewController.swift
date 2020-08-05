//
//  HomeViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let helloLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Olá, "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = UIColor.gray
        return label
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        
        label.text = "usuário!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupLabels() {
        view.addSubview(helloLabel)
    }

}
