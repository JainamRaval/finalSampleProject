//
//  DetailOfUserPresenter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//



class DetailsOfUserPresenter: DetailsOfUserViewToDetailsOfUserPresenter {
    
    weak var view: DetailsOfUserPresenterToDetailsOfUserView?
    
    var interactor: DetailsOfUserPresenterToDetailsOfUserInteractor?
    
    var router: DetailsOfUserPresenterToDetailsOfUserRouter?
    
    func viewDidLoad() {
        interactor?.getDataOfUser()
    }
    
    
    func numberOfRowsInSection() -> Int {
        return 6
    }
    
}

extension DetailsOfUserPresenter : DetailsOfUserInteractorToDetailsOfUserPresenter {
    
    func fetchedDataOfUser(_ User: user) {
        view?.sucessfullyGotData(User)
    }
}
