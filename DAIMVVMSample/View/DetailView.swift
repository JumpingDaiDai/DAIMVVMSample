//
//  DetailView.swift
//  DAIMVVMSample
//
//  Created by Jason_Chung on 2020/9/13.
//  Copyright © 2020 Jason_Chung. All rights reserved.
//

import UIKit
import WebKit

class DetailView : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://mzh.moegirl.org.cn/zh-tw/雷姆(Re:从零开始的异世界生活)"
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
            
            webView.load(URLRequest(url: url))
        }
    }
}
