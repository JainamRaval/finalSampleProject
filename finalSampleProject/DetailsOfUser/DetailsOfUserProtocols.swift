//
//  DetailsOfUserProtocols.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit


protocol DetailsOfUserViewToDetailsOfUserPresenter {
    var view:DetailsOfUserPresenterToDetailsOfUserView? { get set }
    var interactor:DetailsOfUserPresenterToDetailsOfUserInteractor? { get set }
    var router:DetailsOfUserPresenterToDetailsOfUserRouter? { get set }
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
}

protocol DetailsOfUserPresenterToDetailsOfUserView : AnyObject {
    func sucessfullyGotData(_ User:user)
}

protocol DetailsOfUserInteractorToDetailsOfUserPresenter : AnyObject {
    func fetchedDataOfUser(_ User:user)
}

protocol DetailsOfUserPresenterToDetailsOfUserInteractor {
    var presenter:DetailsOfUserInteractorToDetailsOfUserPresenter? { get set }
    var userDetails:user? { get set }
    func getDataOfUser()
}

protocol DetailsOfUserPresenterToDetailsOfUserRouter {
    static func createModule(_ User:user) -> UIViewController?
}
