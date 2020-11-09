//
//  OtherInfoViewController.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit
import WebKit

class OtherInfoViewController : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://mzh.moegirl.org.cn/zh-tw/%E9%9B%B7%E5%A7%86(Re:%E4%BB%8E%E9%9B%B6%E5%BC%80%E5%A7%8B%E7%9A%84%E5%BC%82%E4%B8%96%E7%95%8C%E7%94%9F%E6%B4%BB)"
        if let url = URL(string: self.urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString) {
            
            webView.load(URLRequest(url: url))
        }
    }
}
