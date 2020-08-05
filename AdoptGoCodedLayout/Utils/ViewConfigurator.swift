//
//  ViewConfigurator.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import Foundation

protocol ViewConfigurator {
    func setup()
    func setupConstraints()
    func setupViewHierarchy()
}

extension ViewConfigurator {
    func setup() {
        setupViewHierarchy()
        setupConstraints()
    }
}
