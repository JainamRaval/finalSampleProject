//
//  InputFormPresenter.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class InputFormPresenter: InputFormViewToInputFormPresenter {
    
    weak var view: InputFormPresenterToInputFormView?
    var interactor: InputFormPresenterToInputFormInteractor?
    var router: InputFormPresenterToInputFormRouter?
    
    func viewDidLoad() {
        
    }
    
    func checkForPlist() {
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
            let user = user(firstName: "Jainam", lastName: "Raval", dateOfBirth: "24/01/2001", gender: "male", email: "jainamraval2001@gmail.com", hobby: "love to code", isPassed: false)
            interactor?.addDataOfUsers([user])
        }
    }
    
    func numberOfRowsInSection() -> Int {
        7
    }
    
    func heightOfRows() -> CGFloat {
        100
    }
    
    func viewButtonAction(_ User:user) {
        router?.navigateToDetails(view!, User)
    }
    
    func submitButtonAction(_ User:user) {
        interactor?.addDataOfUsers([User])
    }
    
    func usersButtonAction() {
        let allUsers = interactor?.getDataOfUsers()
        router?.navigateToAllUsers(view!, allUsers!)
    }
}

extension InputFormPresenter : InputFormInteractorToInputFormPresenter {
    
}



