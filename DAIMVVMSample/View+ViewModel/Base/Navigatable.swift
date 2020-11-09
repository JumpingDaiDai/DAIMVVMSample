//
//  Navigatable.swift
//  DAIMVVMSample
//
//  Created by DaiDai on 2020/9/14.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit

protocol Navigatable: UIViewController {
    
    func push(to viewController: UIViewController, animated: Bool)
}

protocol Alertable: UIViewController {
    
    func showAlert(title: String)
}
