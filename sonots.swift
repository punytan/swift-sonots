#!/usr/bin/env xcrun swift

import Cocoa
import WebKit

class WindowDelegate: NSObject, NSWindowDelegate {
    func windowWillClose(notification: NSNotification?) {
        NSApplication.sharedApplication().terminate(0)
    }
}

class ApplicationDelegate: NSObject, NSApplicationDelegate {
    var _window: NSWindow
    init(window: NSWindow) {
        self._window = window
    }
    func applicationDidFinishLaunching(notification: NSNotification?) {
        let webView = WebView(frame: self._window.contentView.frame)
        self._window.contentView.addSubview(webView)
        webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: "https://pbs.twimg.com/profile_images/434324230486757376/_NJDCzqq_400x400.png")!))
    }
}

let application = NSApplication.sharedApplication()
application.setActivationPolicy(NSApplicationActivationPolicy.Regular)

let window = NSWindow(contentRect: NSMakeRect(0, 0, 400, 400), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask, backing: .Buffered, defer: false)
window.center()
window.title = "sonots"
window.makeKeyAndOrderFront(window)
window.delegate = WindowDelegate()

let applicationDelegate = ApplicationDelegate(window: window)
application.delegate = applicationDelegate
application.activateIgnoringOtherApps(true)
application.run()
