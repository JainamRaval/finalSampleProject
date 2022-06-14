//
//  InputFormRouter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class InputFormRouter: InputFormPresenterToInputFormRouter {

    static func createModule() -> UINavigationController {
        let viewController = InputFormView()
        let presenter:(InputFormInteractorToInputFormPresenter & InputFormViewToInputFormPresenter) = InputFormPresenter()
        let interactor:InputFormPresenterToInputFormInteractor = InputFormInteractor()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.router = InputFormRouter()
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func navigateToDetails(_ view: InputFormPresenterToInputFormView, _ data: user) {
        let destinationVC = DetailsOfUserRouter.createModule(data)
        guard let viewController = view as? InputFormView else{
            return
        }
        viewController.navigationController?.pushViewController(destinationVC!, animated: true)
    }
    
    func navigateToAllUsers(_ view: InputFormPresenterToInputFormView, _ data: [user]){
        let destinationVC = AllUsersRouter.createModule(data)
        guard let viewController = view as? InputFormView else{
            return
        }
        viewController.navigationController?.pushViewController(destinationVC!, animated: true)
    }
}
