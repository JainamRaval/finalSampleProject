//
//  InputFormView.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

class InputFormView: UIViewController , InputFormPresenterToInputFormView {
    
    
    var presenter:(InputFormViewToInputFormPresenter & InputFormInteractorToInputFormPresenter)?
    var userdetail = user()
    let inputTitle:[String] = ["First Name:","Last Name:","Date of birth:","Gender:","Email id:","Hobbies:"]
    
    let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ENTER THE USER DETAILS"
        return label
    }()
    
    let tableView:UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.rowHeight = 70
        return tableview
    }()
    
    //it's good practice to remove all the observers while deinitialization
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        print(url)
        
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        navigationItem.title = "FORM"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemFill
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        setupLabel()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCellForInputFormTableViewCell.self, forCellReuseIdentifier: "formCell")
        tableView.register(CustomCellForButtons.self, forCellReuseIdentifier: "buttonsCell")
        setupTableView()
        
        presenter?.checkForPlist()
        
        //inserting gesture onto view to help us with dismissing keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hidekeyboard))
        view.addGestureRecognizer(tap)
        
        //adjustment of tableview, when keyboard comes
        NotificationCenter.default.addObserver(self, selector: #selector(adjustTableView(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustTableView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hidekeyboard(){
        view.endEditing(true)
    }
    
    
    //adjusts table view, when keyboard shows notification and when keyboard hides notification
    @objc func adjustTableView(notification: Notification){
        if notification.name == UIResponder.keyboardWillShowNotification{
            guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardScreenEndFrame = keyboardValue.cgRectValue
            tableView.contentInset.bottom = keyboardScreenEndFrame.height
        }
        else{
            tableView.contentInset.bottom = .zero
        }
        tableView.scrollIndicatorInsets = tableView.contentInset
    }
    
    func setupLabel(){
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
    
    
}

extension InputFormView : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 6){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "buttonsCell", for: indexPath) as? CustomCellForButtons else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath) as? CustomCellForInputFormTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = inputTitle[indexPath.row]
        if inputTitle[indexPath.row] == "Date of birth:"{
            cell.textField.placeholder = "dd/mm/yyyy"
        }
        else if inputTitle[indexPath.row] == "Gender"{
            cell.textField.placeholder = "male/female/other"
        }
        else{
            cell.textField.placeholder = "Enter your \(inputTitle[indexPath.row].prefix(inputTitle[indexPath.row].count - 1))"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.heightOfRows() ?? 50
    }
}

extension InputFormView : TableViewCellDelegate  {
    func ViewButtonTapped() {
        getDataFromTextFields()
        presenter?.viewButtonAction(userdetail)
    }
    func SubmitButtonTapped() {
        getDataFromTextFields()
        let alert = UIAlertController(title: "Hello \(userdetail.firstName)", message: "successfully submitted your details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: {
            for i in 0...5{
                let indexPath = IndexPath(row: i, section: 0)
                guard let cell = self.tableView.cellForRow(at: indexPath) as? CustomCellForInputFormTableViewCell else{
                    return
                }
                cell.textField.text = ""
            }
        })
        presenter?.submitButtonAction(userdetail)
    }
    func UsersButtonTapped() {
        presenter?.usersButtonAction()
    }
    func getDataFromTextFields() {
        for i in 0...5{
            let indexPath = IndexPath(row: i, section: 0)
            guard let cell = tableView.cellForRow(at: indexPath) as? CustomCellForInputFormTableViewCell else{
                return
            }
            switch i{
            case 0:
                userdetail.firstName = cell.textField.text ?? ""
            case 1:
                userdetail.lastName = cell.textField.text ?? ""
            case 2:
                userdetail.dateOfBirth = cell.textField.text ?? ""
            case 3:
                userdetail.gender = cell.textField.text ?? ""
            case 4:
                userdetail.email = cell.textField.text ?? ""
            case 5:
                userdetail.hobby = cell.textField.text ?? ""
            default:
                break
            }
        }
    }
}
