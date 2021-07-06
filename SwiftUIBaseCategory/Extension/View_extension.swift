//
//  View_extension.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI


extension View {
    
    
    func getRect() -> CGRect {
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func getWidth() -> CGFloat {
        
        return UIScreen.main.bounds.width
    }
    
    func getHeight() -> CGFloat {
        
        return UIScreen.main.bounds.height
    }
}

