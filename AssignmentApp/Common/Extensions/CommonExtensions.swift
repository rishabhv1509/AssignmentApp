//
//  CommonExtensions.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//


import UIKit
extension UIColor {
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        
        // Remove the # character from the beginning of the string
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        // Make sure the remaining string only contains valid hexadecimal characters
        guard hexString.count == 6, let hexValue = Int(hexString, radix: 16) else {
            return nil
        }
        
        // Extract the rgb values from the hex value
        let red = CGFloat((hexValue >> 16) & 0xff) / 255.0
        let green = CGFloat((hexValue >> 8) & 0xff) / 255.0
        let blue = CGFloat(hexValue & 0xff) / 255.0
        
        // Initialize the color with the rgb and alpha values
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


extension UIView {
    func addTopBorder(withColor color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: thickness)
        self.layer.addSublayer(border)
    }
}

extension NSError: LocalizedError {
    public var errorDescription: String? {
        return localizedDescription
    }
}
