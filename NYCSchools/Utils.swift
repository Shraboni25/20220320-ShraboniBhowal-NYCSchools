//
//  Utils.swift
//  NYCSchools
//
//  Created by Shraboni on 3/18/22.
//

import Foundation
import UIKit
 
extension UIViewController {
    
    ///Helper function that creates a generic `Okay` Alert
    func presentAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(okayAction)
        self.present(alert, animated: true)
    }
    
}


extension UIView {
    func addAutoLayoutSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
}

extension Int {
    
    var string: String {
         "\(self)"
    }
    
}
