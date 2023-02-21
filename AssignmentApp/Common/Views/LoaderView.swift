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
        loader = UIActivityIndicatorView(frame: frame)
        loader.style = .large
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
