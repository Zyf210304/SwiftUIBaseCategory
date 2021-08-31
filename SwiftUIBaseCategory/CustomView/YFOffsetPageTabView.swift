//
//  OffsetPageTabView.swift
//  AnimatedIndecator
//
//  Created by 张亚飞 on 2021/8/30.
//

import SwiftUI

// Custom View that Will return offset for Paging Control...
struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping ()-> Content) {
        
        self.content = content()
        self._offset = offset
    }
    
    func makeCoordinator() -> Coordinator {
        
        return OffsetPageTabView.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let scrollView = UIScrollView()
        
        //Extracting SwiftUI View and embedding into UIkit scrollView
        let  hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
        
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // if you are using vertical Paging...
            // then dont declare height constraint...
            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ]
        
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
        
        //enabling paging
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //setting Delegate...
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        //need to update only when offset changed manually...
        //just check the current and scrollview offsets...
        
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset {
            
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    //pager Offset...
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: OffsetPageTabView
        
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}



struct OffsetPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
