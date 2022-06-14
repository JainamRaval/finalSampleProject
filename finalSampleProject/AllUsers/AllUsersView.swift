//
//  AllUsersView.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class AllUsersView: UIViewController , AllUsersPresenterToAllUsersView {

    var presenter: (AllUsersViewToAllUsersPresenter & AllUsersInteractorToAllUsersPresenter)?
    var userDetail:[user]?
    
    let tableView:UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        presenter?.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCellForAllUser.self , forCellReuseIdentifier: "allUsersCell")
        setupTableView()
        
        navigationItem.title = "SAVED USERS"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemFill
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
    
    func successfullyGotData(_ User: [user]) {
        userDetail = User
    }
    
    func configurCell(cell: CustomCellForAllUser,row: Int){
        let user = userDetail![row]
        cell.nameLabel.text = user.firstName + " " + user.lastName
        cell.dobLabel.text = "Date of birth: " + user.dateOfBirth
        cell.genderLabel.text = "Gender: " + user.gender
        cell.emailLabel.text = "Email id: " + user.email
        cell.hobbyLabel.text = "Hobby: " + user.hobby
        cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cell.isPassedSwitch.isOn = user.isPassed
        cell.isPassedSwitch.addTarget(self, action: #selector(switchToggled(sender:)), for: .valueChanged)
        cell.isPassedSwitch.tag = row
        cell.selectionStyle = .none
    }
    
    @objc func switchToggled(sender: UISwitch){
        userDetail![sender.tag].isPassed = sender.isOn
        presenter?.switchAction(userDetail!)
    }
}

extension AllUsersView: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetail?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allUsersCell", for: indexPath) as? CustomCellForAllUser else{
            return UITableViewCell()
        }
        configurCell(cell: cell, row: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
