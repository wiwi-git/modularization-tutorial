//
//  MyPageViewController.swift
//  MyPage
//
//  Created by apple on 2023/05/19.
//

import UIKit

open class MyPageViewController: UIViewController {
    private var nameLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "---MyPage---"
        label.textAlignment = .center
        return label
    }()
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        basicLayout()
    }
    
    private func basicLayout() {
        view.addSubview(nameLabel)
        self.view.backgroundColor = .white
        
        let safeArea =  self.view.safeAreaLayoutGuide
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        [
            nameLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ].forEach { $0.isActive = true }
    }
}
