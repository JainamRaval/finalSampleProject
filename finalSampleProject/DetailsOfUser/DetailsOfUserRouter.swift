//
//  DetailOfUserRouter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class DetailsOfUserRouter: DetailsOfUserPresenterToDetailsOfUserRouter {

    static func createModule(_ User:user) -> UIViewController? {
        let viewController = DetailsOfUserView()
        let presenter:(DetailsOfUserInteractorToDetailsOfUserPresenter & DetailsOfUserViewToDetailsOfUserPresenter) = DetailsOfUserPresenter()
        let interactor:DetailsOfUserPresenterToDetailsOfUserInteractor = DetailsOfUserInteractor()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.router = DetailsOfUserRouter()
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.userDetails = User
        
        return viewController
    }
    
}
