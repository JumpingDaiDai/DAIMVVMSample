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
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.youtube.com"
        if let url = URL(string: self.urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString) {
            
            webView.load(URLRequest(url: url))
        }
    }
}
