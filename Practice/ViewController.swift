//
//  ViewController.swift
//  Practice
//
//  Created by Practica on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonWidthConstant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        switch newCollection.verticalSizeClass {
        case .compact:
            buttonWidthConstant.priority = .required
        case .regular, .unspecified:
            buttonWidthConstant.priority = .defaultLow
        @unknown default:
            fatalError()
        }
    }
    
}

