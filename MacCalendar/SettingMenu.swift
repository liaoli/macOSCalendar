//
//  SettingMenu.swift
//  StatebarCalendar
//
//  Created by bugcode on 2016/12/10.
//  Copyright © 2016年 bugcode. All rights reserved.
//

import Cocoa

class SettingMenu: NSMenu {

    init() {
        super.init(title: "Setting")
        // 设置项
        let set = self.insertItem(withTitle: "设置", action: #selector(SettingMenu.setting(_:)), keyEquivalent: "", at: 0)
        set.target = self
        // 工具
        let tool = self.insertItem(withTitle: "工具", action: #selector(SettingMenu.tools(_:)), keyEquivalent: "", at: 1)
        tool.target = self
        // 关于
        let ab = self.insertItem(withTitle: "关于", action: #selector(SettingMenu.about(_:)), keyEquivalent: "", at: 2)
        ab.target = self
        // 退出
        let qt = self.insertItem(withTitle: "退出", action: #selector(SettingMenu.quit(_:)), keyEquivalent: "", at: 3)
        qt.target = self
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 设置界面回调
    func setting(_ sender: NSMenuItem){
        (NSApp.delegate as! AppDelegate).openSettingWindow()
    }
    
    // 工具菜单回调
    func tools(_ sender: NSMenuItem){
        (NSApp.delegate as! AppDelegate).openToolsWindow();
    }
    
    // 关于页面回调
    func about(_ sender: NSMenuItem) {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let abbr = [ NSForegroundColorAttributeName: NSColor.black , NSParagraphStyleAttributeName : style, NSFontAttributeName : NSFont.systemFont(ofSize: 11.0)]
        
        let infoAttributedStr = NSAttributedString(string: "report: bugcoding@hotmail.com", attributes: abbr)
        
        NSApp.orderFrontStandardAboutPanel(options: ["Credits":infoAttributedStr])
    }
    // 退出回调
    func quit(_ sender: NSMenuItem) {
        NSApp.terminate(nil)
    }
}
