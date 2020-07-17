//
//  DetailViewController.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import GameDBCore

class DetailViewController: BaseViewController<DetailViewModel> {
    
    var slug: String = "" {
        didSet{
            self.viewModel.getGameDetail(slug: self.slug)
        }
    }

    private lazy var detailHeader: DetailHeader = {
        let view: DetailHeader = DetailHeader(observable: self.viewModel.gameObservable.asObservable())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private lazy var detailDescription: DetailDescription = {
        let view: DetailDescription = DetailDescription(observable: self.viewModel.gameObservable.asObservable())
        view.layoutMargins = UIEdgeInsets(top: 0, left: ResourceHelper.Spacing.base, bottom: ResourceHelper.Spacing.base, right: ResourceHelper.Spacing.base)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Detail Page"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view: UIScrollView = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = ResourceHelper.Spacing.base
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9568627451, green: 0.9921568627, blue: 0.9882352941, alpha: 0.59)
        self.navigationController?.navigationBar.backgroundColor = .clear
    }

    override func setupView() {
        super.setupView()
        
        self.view.backgroundColor = ResourceHelper.Color.backgroundColor
        
        self.view.addSubview(self.scrollView)
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.scrollView.addSubview(self.containerStackView)
        self.containerStackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.containerStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        self.containerStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.containerStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        
        self.containerStackView.addArrangedSubview(self.detailHeader)
        self.containerStackView.addArrangedSubview(self.detailDescription)
    }
}
