//
//  AllUserPresenter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

class AllUsersPresenter: AllUsersViewToAllUsersPresenter {
    
    weak var view: AllUsersPresenterToAllUsersView?
    
    var interactor: AllUsersPresenterToAllUsersInteractor?
    
    var router: AllUsersPresenterToAllUsersRouter?
    
    func viewDidLoad() {
        interactor?.getDataOfUser()
    }
    
    func switchAction(_ User: [user]) {
        interactor?.addDataOfUser(User)
    }
    
}

extension AllUsersPresenter : AllUsersInteractorToAllUsersPresenter {
    
    func fetchedDataOfUser(_ User: [user]) {
        view?.successfullyGotData(User)
    }
}
