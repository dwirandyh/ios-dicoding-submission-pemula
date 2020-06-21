//
//  BaseViewController.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 20/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import RxSwift

public protocol BaseView {
    func setupObserver()
    func setupView()
}

open class BaseViewController<T: BaseViewModel>: UIViewController {
    
    public var viewModel: T!
    
    public let disposeBag: DisposeBag = DisposeBag()
    public lazy var loadingDialog: UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    
    
    public init(viewModel: T){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        
        self.setupView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.setupObserver()
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open func setupObserver(){
        self.viewModel.loadingObservable
            .subscribe(onNext: { (isLoading) in
                if isLoading {
                    if self.presentedViewController == nil  {
                        self.present(self.loadingDialog, animated: true, completion: nil)
                    }
                } else {
                    if self.presentedViewController != nil {
                        self.loadingDialog.dismiss(animated: true, completion: nil)
                    }
                }
            }).disposed(by: self.disposeBag)
    }
    
    open func setupView(){
    }
}