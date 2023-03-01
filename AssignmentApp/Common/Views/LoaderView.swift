//
//  LoaderView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit

//Loader view shown during the initial API call fetch
class LoaderView: UIView {
    private var loader: UIActivityIndicatorView!

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        print("frame---", frame)
        loader = UIActivityIndicatorView(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        loader.frame =
        loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        loader.style = .large
//        loader.style = .large

    }
    
    //This method starts the loader on the screen
    func startLoading(view: UIView) {
        loader.startAnimating()
        view.addSubview(loader)
    }
    
    //This method stops the loader by removing from super View
    func stopLoading(view: UIView) {
        loader.stopAnimating()
        loader.removeFromSuperview()
    }
}
