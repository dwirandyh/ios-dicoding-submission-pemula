//
//  HomeRouter.swift
//  GameDB
//
//  Created by Dwi Randy Herdinanto on 21/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import UIKit
import Swinject

protocol HomeRouter {
    func goToDetail(_ caller: UIViewController, slug: String)
}

class HomeRouterImpl: HomeRouter {
    func goToDetail(_ caller: UIViewController, slug: String) {
        let viewController = Assembler.sharedAssembler.resolver.resolve(DetailViewController.self)!
        viewController.slug = slug
        caller.navigationController?.pushViewController(viewController, animated: true)
    }
}
