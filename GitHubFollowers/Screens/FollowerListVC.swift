//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 08.02.2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
