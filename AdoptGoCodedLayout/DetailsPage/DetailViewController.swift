//
//  DetailViewController.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 04/09/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit
import TinyConstraints

class DetailViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    // MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Center of container view"
        return label
    }()
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(label)
        
        label.center(in: containerView)
        
    }
}
