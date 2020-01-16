//
//  BaseViewController.swift
//  TableViewExercise
//
//  Created by Swati Chandran on 16/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var activity: UIActivityIndicatorView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showActivityIndicator(isShow: Bool) {
        if isShow {
            activity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            activity?.frame = view.frame
            view.addSubview(activity!)
            activity?.startAnimating()
        }
        else{
            
            activity?.stopAnimating()
            activity?.removeFromSuperview()
        }
    }
    
}
