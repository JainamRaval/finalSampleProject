//
//  CustomCellForButtons.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit

protocol TableViewCellDelegate {
    func ViewButtonTapped()
    func SubmitButtonTapped()
    func UsersButtonTapped()
}

class CustomCellForButtons: UITableViewCell {

    var delegate:TableViewCellDelegate?
    
    let viewButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("VIEW", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        return button
    }()
    
    let submitButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SUBMIT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        return button
    }()
    
    let usersButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("USERS", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewButton()
        setupSubmitButton()
        setupUserButton()
        
        submitButton.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        
        viewButton.addTarget(self, action: #selector(viewButtonTapped), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        usersButton.addTarget(self, action: #selector(usersButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewButtonTapped(){
        delegate?.ViewButtonTapped()
    }
    
    @objc func submitButtonTapped(){
        delegate?.SubmitButtonTapped()
    }
    
    @objc func usersButtonTapped(){
        delegate?.UsersButtonTapped()
    }
    
    func setupViewButton(){
        self.contentView.addSubview(viewButton)
        
        viewButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        viewButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        viewButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.28).isActive = true
    }
    
    func setupSubmitButton(){
        self.contentView.addSubview(submitButton)
        
        submitButton.leadingAnchor.constraint(equalTo: viewButton.trailingAnchor, constant: 20).isActive = true
        submitButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    func setupUserButton(){
        self.contentView.addSubview(usersButton)
        
        usersButton.leadingAnchor.constraint(equalTo: submitButton.trailingAnchor, constant: 20).isActive = true
        usersButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        usersButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        usersButton.widthAnchor.constraint(equalTo: viewButton.widthAnchor).isActive = true
    }
}
