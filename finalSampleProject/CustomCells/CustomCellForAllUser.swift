
import UIKit

class CustomCellForAllUser: UITableViewCell {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let dobLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let genderLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let hobbyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let isPassedLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Is Passed:"
        return label
    }()

    let isPassedSwitch:UISwitch = {
        let Switch = UISwitch()
        Switch.translatesAutoresizingMaskIntoConstraints = false
        Switch.isOn = false
        return Switch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNameLabel()
        setupDobLabel()
        setupGenderLabel()
        setupEmailLabel()
        setupHobbyLabel()
        setupIsPassedLabel()
        setupIsPassedSwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameLabel(){
        self.contentView.addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    
    func setupDobLabel(){
        self.contentView.addSubview(dobLabel)
        
        dobLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        dobLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        dobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10).isActive = true
    }
    
    func setupGenderLabel(){
        self.contentView.addSubview(genderLabel)
        
        genderLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        genderLabel.topAnchor.constraint(equalTo: dobLabel.bottomAnchor).isActive = true
    }
    
    func setupEmailLabel(){
        self.contentView.addSubview(emailLabel)
        
        emailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor).isActive = true
    }
    
    func setupHobbyLabel(){
        self.contentView.addSubview(hobbyLabel)
        
        hobbyLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        hobbyLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        hobbyLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    
    func setupIsPassedLabel(){
        self.contentView.addSubview(isPassedLabel)
        
        isPassedLabel.topAnchor.constraint(equalTo: hobbyLabel.bottomAnchor).isActive = true
        isPassedLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        isPassedLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -5).isActive = true
        isPassedLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupIsPassedSwitch(){
        self.contentView.addSubview(isPassedSwitch)
        
        isPassedSwitch.leadingAnchor.constraint(equalTo: isPassedLabel.trailingAnchor,constant: 10).isActive = true
        isPassedSwitch.centerYAnchor.constraint(equalTo: isPassedLabel.centerYAnchor).isActive = true
    }
    
}
