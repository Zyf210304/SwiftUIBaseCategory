//
//  Color_extension.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI


extension Color {
    
    /// 16进制颜色
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
