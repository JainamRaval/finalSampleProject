//
//  CustomCellsForDetails.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 14/06/22.
//

import UIKit

class CustomCellsForDetails: UITableViewCell {
    
    let labelForTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let labelForDetail:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabelForTitle()
        setupLabelForDetail()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelForTitle(){
        self.contentView.addSubview(labelForTitle)
        
        labelForTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        labelForTitle.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        labelForTitle.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupLabelForDetail(){
        self.contentView.addSubview(labelForDetail)
        
        labelForDetail.leadingAnchor.constraint(equalTo: labelForTitle.trailingAnchor,constant: 20).isActive = true
        labelForDetail.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 20).isActive = true
        labelForDetail.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -20).isActive = true
        labelForDetail.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}
