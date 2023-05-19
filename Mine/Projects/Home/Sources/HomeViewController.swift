//
//  HomeViewController.swift
//  Home
//
//  Created by apple on 2023/05/19.
//

import UIKit

open class HomeViewController: UIViewController {
    private var plusButton: UIButton?
    private var minusButton: UIButton?
    private var countLabel: UILabel {
        let label: UILabel = .init()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        plusButton  = self.makeButton(title: "더하기", color: .black, action: #selector(self.buttonAction))
        minusButton  = self.makeButton(title: "빼기", color: .black, action: #selector(self.buttonAction))
        basicLayout()
        // Do any additional setup after loading the view.
    }
    
    private func makeButton(title: String, color: UIColor, action: Selector) -> UIButton {
        let button: UIButton = .init()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    private func basicLayout() {
        view.backgroundColor = .white
        view.addSubview(plusButton!)
        view.addSubview(minusButton!)
        view.addSubview(countLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        [ plusButton, minusButton, countLabel ].forEach { $0?.translatesAutoresizingMaskIntoConstraints = false }
        
        [
            plusButton?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            plusButton?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            minusButton?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            minusButton?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 20),
            countLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ].forEach { $0?.isActive = true }
    }
    
    @objc
    private func buttonAction(_ sender: UIButton) {
        print("touch \(sender.titleLabel?.text ?? "")")
    }

}
