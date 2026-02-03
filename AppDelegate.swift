import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // 创建菜单栏图标
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusBarItem?.button {
            button.image = NSImage(systemSymbolName: "square.grid.2x2.fill", accessibilityDescription: "Emoji Tracker")
            button.action = #selector(toggleWindow)
        }
    }

    @objc func toggleWindow() {
        // 这里我们可以控制窗口的显示与隐藏
        // 目前是空方法，后面会补充逻辑来控制窗口
    }
}
