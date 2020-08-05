//
//  NSMutableAttributedString+Styles.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 05/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    @discardableResult
    func normal(_ text: String, _ size: CGFloat, _ color: UIColor) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: size), .foregroundColor: color]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        append(attributedString)
        
        return self
    }
    
    @discardableResult 
    func bold(_ text: String, _ size: CGFloat, _ color: UIColor) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: size, weight: .bold), .foregroundColor: color]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        append(attributedString)
        
        return self
    }
    
    class func append(_ strings: [NSMutableAttributedString]) -> NSMutableAttributedString {
        let str = NSMutableAttributedString()
        for st in strings {
            str.append(st)
        }

        return str
    }
}
