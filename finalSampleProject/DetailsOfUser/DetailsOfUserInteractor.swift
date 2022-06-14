//
//  DetailOfUserInteractor.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//


class DetailsOfUserInteractor: DetailsOfUserPresenterToDetailsOfUserInteractor {
    weak var presenter: DetailsOfUserInteractorToDetailsOfUserPresenter?
    var userDetails: user?
    
    func getDataOfUser() {
        presenter?.fetchedDataOfUser(userDetails!)
    }
}
