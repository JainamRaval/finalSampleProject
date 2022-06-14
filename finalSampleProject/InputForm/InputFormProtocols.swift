//
//  InputFormProtocols.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

protocol InputFormViewToInputFormPresenter {
    var view:InputFormPresenterToInputFormView? { get set }
    var interactor:InputFormPresenterToInputFormInteractor? { get set }
    var router:InputFormPresenterToInputFormRouter? { get set }
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func heightOfRows() -> CGFloat
    func checkForPlist()
    func viewButtonAction(_ User:user)
    func submitButtonAction(_ User:user)
    func usersButtonAction()
}

protocol InputFormPresenterToInputFormView : AnyObject {
    
}

protocol InputFormInteractorToInputFormPresenter : AnyObject {
    
}

protocol InputFormPresenterToInputFormInteractor {
    var presenter:InputFormInteractorToInputFormPresenter? { get set }
    
    func addDataOfUsers(_ users:[user])
    func getDataOfUsers() -> [user]
}

protocol InputFormPresenterToInputFormRouter {
    static func createModule() -> UINavigationController
    func navigateToDetails(_ view:InputFormPresenterToInputFormView ,_ data:user)
    func navigateToAllUsers(_ view: InputFormPresenterToInputFormView, _ data: [user])
}

