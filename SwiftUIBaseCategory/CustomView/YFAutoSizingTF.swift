//
//  YFAutoSizingTF.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI


// building autosize text filed...
struct YFAutoSizingTF: UIViewRepresentable {
    
    var hint: String
    @Binding var text: String
    @Binding var containerHeight: CGFloat
    
    var onEnd : () -> ()
    
    func makeCoordinator() -> Coordinator {
        
        return YFAutoSizingTF.Coordinator(parent:  self)
        
    }
    
    
    func makeUIView(context: Context) -> UITextView {
        
        let  textView = UITextView()
        
        textView.text = hint
        textView.textColor = .gray
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 20)
        
        textView.delegate = context.coordinator
        
        //input accessory view..
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        
        //since we need done at right...
        //so using another item as spacer...
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(context.coordinator.closeKeyBoard))
        
        toolBar.items = [spacer, doneButton]
        toolBar.sizeToFit()
        
        textView.inputAccessoryView = toolBar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        DispatchQueue.main.async {
            
            if containerHeight == 0 {
                
                containerHeight = uiView.contentSize.height
            }
        }
    }
    
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        //to read all parent properties
        var  parent: YFAutoSizingTF
        
        init(parent: YFAutoSizingTF) {
            
            self.parent = parent
        }
        
        //keyboard close @objc function...
        @objc func closeKeyBoard() {
            
            parent.onEnd()
        }
        
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            if textView.text == parent.hint {
                
                textView.text = ""
                textView.textColor = UIColor(Color.primary)
            }
        }
        
        
        func textViewDidChange(_ textView: UITextView) {
            
            parent.text = textView.text
            parent.containerHeight = textView.contentSize.height
        }
        
        //on end checking if textbox is empty
        //if so then put hint
        func textViewDidEndEditing(_ textView: UITextView) {
            
            if textView.text == "" {
                
                textView.text = parent.hint
                textView.textColor = .gray
            }
        }
        
    }
}
