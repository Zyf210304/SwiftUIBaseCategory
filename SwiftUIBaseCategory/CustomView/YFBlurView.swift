//
//  YFBlurView.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI


struct YFBlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        
        return view
    }
    
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}
