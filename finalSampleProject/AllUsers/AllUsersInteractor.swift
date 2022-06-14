//
//  AllUsersInteractor.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//


import UIKit

class AllUsersInteractor: AllUsersPresenterToAllUsersInteractor {
    
    var userDetails: [user]?
    weak var presenter: AllUsersInteractorToAllUsersPresenter?
    
    func getDataOfUser() {
        presenter?.fetchedDataOfUser(userDetails!)
    }
    
    func addDataOfUser(_ allUsers: [user]) {
        let encoder = PropertyListEncoder()
        guard let encodedData = try? encoder.encode(allUsers) else{
            print("failed to encode the data")
            return
        }
        do{
            try encodedData.write(to: fileURL)
        }catch {
            print("failed to write data in plist file")
            print("error is: \(error.localizedDescription)")
        }
    }
}
