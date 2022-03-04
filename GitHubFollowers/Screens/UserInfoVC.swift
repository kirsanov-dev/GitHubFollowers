//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 26.02.2022.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let middleView = UIView()
    let bottomView = UIView()
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupLayout()
        getUserInfo()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func setupLayout() {
        
        let heightOne: CGFloat = 180
        let heightTwo: CGFloat = 140
        let padding: CGFloat = 20
        let views: [UIView] = [headerView, middleView, bottomView]
        
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            middleView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: padding)
        ])
        
        headerView.heightAnchor.constraint(equalToConstant: heightOne).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: heightTwo).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: heightTwo).isActive = true
        
    }
    
    func add(childVC: UIViewController, to containerView: UIView ) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
