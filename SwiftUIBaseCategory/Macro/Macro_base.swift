//
//  Macro_base.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI

/*!
 打印内容，并包含类名和打印所在行数
 - Parameters:  泛型，打印对象
 - file: 打印所属类
 - lineNumber: 打印语句所在行数
 */
func YFLog<T>(parameter : T, file : String = #file, lineNumber : Int = #line)
{
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):line:\(lineNumber)]\n -\(parameter)\n")
    
    #endif
}

///屏高
let kScreenHeight = UIScreen.main.bounds.size.height

//屏宽
let kScreenWidth = UIScreen.main.bounds.size.width

//iPhonex以上判断
let IS_IPhoneX_All = (kScreenHeight == 812 || kScreenHeight == 896)

//导航栏高
let YFDevice_NaviBar_Height = (IS_IPhoneX_All ? 88 : 64)

//状态栏高
let YFDevice_StatusBar_Height = (IS_IPhoneX_All ? 44 : 20)

//选项卡高
let YFDevice_TabBar_Height = (IS_IPhoneX_All ? 83 : 49)

//安全区高
let YFDevice_SafeArea_BottomHeight = (IS_IPhoneX_All ? 34 : 0)

/**宽度比例*/
func YF_ScaleWidth(_ font:CGFloat) -> (CGFloat) {
   return (kScreenWidth/375)*font

}

/**高度比例*/
func YF_ScaleHeight(_ font:CGFloat) -> (CGFloat) {
  return  kScreenHeight/667*font

}

/**字体比例*/
func YF_ScaleFont(_ font:CGFloat) -> (CGFloat) {
    return  kScreenWidth/375*font

}




