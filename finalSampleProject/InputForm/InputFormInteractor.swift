//
//  InputFormInteractor.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class InputFormInteractor: InputFormPresenterToInputFormInteractor {
    
    weak var presenter: InputFormInteractorToInputFormPresenter?
    
    func addDataOfUsers(_ User:[user]){
        var allUsers = getDataOfUsers()
        allUsers.append(User[0])
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

    
    func getDataOfUsers() -> [user]{
        guard let data = try? Data(contentsOf: fileURL) else{
            print("failed to get data from plist")
            return []
        }
        let decoder = PropertyListDecoder()
        guard let allUser = try? decoder.decode([user].self, from: data) else{
            print("failed to decode the data")
            return []
        }
        return allUser
    }
}
