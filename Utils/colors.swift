//
//  ColorFromHex.swift
//  Testing_Nav
//
//  Created by zcrome on 7/17/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        
        var colorString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if colorString.hasPrefix("#"){
            colorString.remove(at: colorString.startIndex)
        }
        
        if colorString.characters.count == 6{
            var rgbValue:UInt32 = 0
            Scanner(string: colorString).scanHexInt32(&rgbValue)
            
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255, green: CGFloat((rgbValue & 0x00FF00) >> 8)/255, blue: CGFloat(rgbValue & 0x0000FF)/255, alpha: CGFloat(1))
        }else if colorString.characters.count == 8{
            var rgbValue:UInt32 = 0
            Scanner(string: colorString).scanHexInt32(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0x00FF0000) >> 16)/255, green: CGFloat((rgbValue & 0x0000FF00) >> 8)/255, blue: CGFloat(rgbValue & 0x000000FF)/255, alpha: CGFloat((rgbValue & 0xFF000000) >> 24)/255)
        }else{
            self.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
}

extension UIColor{
    
    //NAME OF PLST: AppColors
    //IT IS REQUIRED USE OF A PLIST FILE

    convenience init(colorFromDict: String){
        
        if let path = Bundle.main.path(forResource: "AppColors", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) {
            if let color = dict.value(forKey: colorFromDict) as? String{
                self.init(hex: color)
            }else{
                self.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
            }
        }else{
            self.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}






