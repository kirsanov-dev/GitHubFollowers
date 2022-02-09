//
//  UIViewController + Extension.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 09.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
