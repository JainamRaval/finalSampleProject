//
//  DetailOfUserView.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.


import UIKit

class DetailsOfUserView: UIViewController , DetailsOfUserPresenterToDetailsOfUserView {

    var presenter: (DetailsOfUserViewToDetailsOfUserPresenter & DetailsOfUserInteractorToDetailsOfUserPresenter)?
    var userDetail = user()
    
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
        tableView.register(CustomCellsForDetails.self, forCellReuseIdentifier: "detailCell")
        
        navigationItem.title = "Details of \(userDetail.firstName)"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemFill
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        setupTableView()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
    
    func sucessfullyGotData(_ User: user) {
        userDetail = User
    }
}

extension DetailsOfUserView: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? CustomCellsForDetails else{
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.labelForTitle.text = "First Name:"
            cell.labelForDetail.text = userDetail.firstName
        case 1:
            cell.labelForTitle.text = "Last Name:"
            cell.labelForDetail.text = userDetail.lastName
        case 2:
            cell.labelForTitle.text = "Date of birth:"
            cell.labelForDetail.text = userDetail.dateOfBirth
        case 3:
            cell.labelForTitle.text = "Gender:"
            cell.labelForDetail.text = userDetail.gender
        case 4:
            cell.labelForTitle.text = "Email id:"
            cell.labelForDetail.text = userDetail.email
        case 5:
            cell.labelForTitle.text = "Hobbies:"
            cell.labelForDetail.text = userDetail.hobby
        default:
            return cell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

