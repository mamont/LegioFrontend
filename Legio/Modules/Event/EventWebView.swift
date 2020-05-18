//
//  EventWebView.swift
//  Legio
//
//  Created by Mac on 20.10.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit
import WebKit
import NotificationBannerSwift

/// Контроллер, отображающий url события на экране
final class EventWebView: UIViewController, WKNavigationDelegate {
    
    private enum Texts {
        static let urlErrorTitle: String = "Ошибка"
        static let urlErrorSubtitle: String = "Некорректный url события"
    }
    
    /// URL события
    var urlString: String?
    
    /// WebView
    private lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    /// Кнопка назад
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(named: "backButton")
        button.setImage(image, for: .normal)
        button.setImage(image, for: .selected)
        button.addTarget(self, action:#selector(didBackButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
        configureBackButton()
        loadUrl()
    }
    
    
    // MARK: - Private methods
    
    /// Конфигурация расположения webView
    private func configureWebView() {
        
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    /// Конфигурация расположения backButton
    private func configureBackButton() {
        
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    /// Загрузка url события
    private func loadUrl() {
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                showNotificationBanner(
                    title: Texts.urlErrorTitle,
                    subtitle: Texts.urlErrorSubtitle,
                    style: .warning)
                return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    /// Функция, возвращающая к предыдущему экрану
    @objc
    private func didBackButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
}
