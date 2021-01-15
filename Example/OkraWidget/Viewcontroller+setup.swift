//
//  Viewcontroller+setup.swift
//  FlutterwaveSDK_Example
//
//  Created by Rotimi Joshua on 02/10/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setupLaunchButton()
        view.backgroundColor = UIColor(hex: "#e8efeb")
        
    }
    func addAllViews(){
        view.addSubview(launchButton)
        
        NSLayoutConstraint.activate([
            launchButton.heightAnchor.constraint(equalToConstant: 50),
            launchButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            launchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            launchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
  
        ])
    }
    
    func setupLaunchButton(){
        launchButton.setTitle("LAUNCH OKRA", for: .normal)
        launchButton.setTitleColor(.white, for: .normal)
        launchButton.backgroundColor = UIColor(hex: "#86aba1")
        launchButton.layer.cornerRadius = 4
        launchButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        launchButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.addTarget(self, action: #selector(showExample), for: .touchUpInside)
 
    }
}

