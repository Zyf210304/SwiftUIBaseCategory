//
//  Shap_extension.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI

///example :  CustomCorners(corners: [.topRight, .bottomRight], radius: 10)
struct CustomCorners: Shape {
   
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

