//
//  AllUsersRouter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class AllUsersRouter: AllUsersPresenterToAllUsersRouter {

    static func createModule(_ User:[user]) -> UIViewController? {
        let viewController = AllUsersView()
        let presenter:(AllUsersInteractorToAllUsersPresenter & AllUsersViewToAllUsersPresenter) = AllUsersPresenter()
        let interactor:AllUsersPresenterToAllUsersInteractor = AllUsersInteractor()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.router = AllUsersRouter()
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.userDetails = User
        
        return viewController
    }
    
}
