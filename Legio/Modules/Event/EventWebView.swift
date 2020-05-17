//
//  EventWebView.swift
//  Legio
//
//  Created by Mac on 20.10.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit
import WebKit

class EventWebView: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var urlString: String?
    
    private lazy var backButton: UIButton = {
        
        let buttonFrame = CGRect(x: 0, y: 30, width: 40, height: 40)
        let button = UIButton(frame: buttonFrame)
        let image = UIImage(named: "backButton")
        button.setImage(image, for: .normal)
        button.setImage(image, for: .selected)
        button.addTarget(self, action:#selector(didBackButtonTap), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
        configureMargins()
        configureBackButton()
    }
    
    
    // MARK: - Private methods
    
    private func configureMargins() {
        view.insetsLayoutMarginsFromSafeArea = false
    }
    
    private func configureWebView() {
        
        let url = URL(string: urlString!)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    private func configureBackButton() {
        view.addSubview(backButton)
    }
    
    @objc
    private func didBackButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
}
