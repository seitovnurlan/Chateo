//
//  ContactsViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 24/2/24.
//

import UIKit

class ContactsViewController: UIViewController {
    var contactArray = [Contacts]()
    var contact: Contacts?

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPaddingPointsCustom(36)
        textField.placeholder = "Search"
        textField.textColor = UIColor(named: "textcolorphone")
        textField.textAlignment = .left
//        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        
        return textField
    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(named: "textcolorphone")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var contactsTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .horizontal)
//        let tableView = UITableView(frame: .zero, style: .plain)
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactsTableViewCell")
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = "Contacts"
        setupViews()
        setupConstraints()
        loadData()
    }
    func loadData() {
        contactArray.append(Contacts(imageCont: "Athalia", nameCont: "Athalia Putri", statusCont: "Last seen yesterday"))
        contactArray.append(Contacts(imageCont: "Erlan", nameCont: "Erlan Sadewa", statusCont: "Online"))
        contactArray.append(Contacts(imageCont: "Midala", nameCont: "Midala Huera", statusCont: "Last seen 3 hours ago"))
        contactArray.append(Contacts(imageCont: "Nafisa", nameCont: "Nafisa Gitari", statusCont: "Online"))
        contactArray.append(Contacts(imageCont: "Raki", nameCont: "Raki Devon", statusCont: "Online"))
        contactArray.append(Contacts(imageCont: "Salsa", nameCont: "Salsabila Akira", statusCont: "Last seen 30 minutes ago"))
        contactArray.append(Contacts(imageCont: "Angelina", nameCont: "Angelina Jolie", statusCont: "Online"))
        contactArray.append(Contacts(imageCont: "dev", nameCont: "Marina Sharapova", statusCont: "Last seen 40 minutes ago"))
        contactArray.append(Contacts(imageCont: "Jason", nameCont: "Jason Statham", statusCont: "Online"))
        contactArray.append(Contacts(imageCont: "Justin", nameCont: "Justin Timberlake", statusCont: "Last seen 20 minutes ago"))
        contactArray.append(Contacts(imageCont: "Penelope", nameCont: "Penelope Cruz", statusCont: "Last seen 20 minutes ago"))
        
        
        var _: Contacts = contactArray[0]
    }
    
    func setupViews() {
        view.addSubview(searchTextField)
        view.addSubview(searchImageView)
        view.addSubview(contactsTableView)
        
    }
    func setupConstraints() {
       
        searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(95)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(36)
        }
        
        searchImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(103)
            make.leading.equalTo(24)
            make.height.width.equalTo(20)
        }
        contactsTableView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.reuseIdentifier, for: indexPath) as! ContactsTableViewCell
        if indexPath.row < contactArray.count {
                let contact = contactArray[indexPath.row]
                cell.configure(with: contact)
            }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
    }
}
