//
//  ViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 21/2/24.
//

import UIKit

class ChatsViewController: UIViewController {
    
    var contArray = [Contacts]()
    var cont: Contacts?
    
    private lazy var searchCVTextField: UITextField = {
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
    
    private lazy var searchCVImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(named: "textcolorphone")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: 190, height: 330)
        layout.scrollDirection = .vertical
        let view =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.register(
            CustomCollectionViewCell.self,
            forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier
        )
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationItem.hidesBackButton = true
    }

    
//    override func viewDidAppear(_ animated: Bool) {
//           super.viewDidAppear(animated)
//           navigationController?.viewControllers.first?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Chats", style: .plain, target: nil, action: nil)
//        
//       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let customButton = UIBarButtonItem(title: "Chat", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = customButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        let backButtonFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: backButtonFont], for: .normal)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Chats", style: .plain, target: nil, action: nil)
        setupViews()
        setupConstraints()
        loadData()
        
    }
    func loadData() {
        contArray.append(Contacts(imageCont: "Athalia", nameCont: "Athalia Putri", statusCont: "Last seen yesterday"))
        contArray.append(Contacts(imageCont: "Erlan", nameCont: "Erlan Sadewa", statusCont: "Online"))
        contArray.append(Contacts(imageCont: "Midala", nameCont: "Midala Huera", statusCont: "Last seen 3 hours ago"))
        contArray.append(Contacts(imageCont: "Nafisa", nameCont: "Nafisa Gitari", statusCont: "Online"))
        contArray.append(Contacts(imageCont: "Raki", nameCont: "Raki Devon", statusCont: "Online"))
        contArray.append(Contacts(imageCont: "Salsa", nameCont: "Salsabila Akira", statusCont: "Last seen 30 minutes ago"))
        contArray.append(Contacts(imageCont: "Angelina", nameCont: "Angelina Jolie", statusCont: "Online"))
        contArray.append(Contacts(imageCont: "dev", nameCont: "Marina Sharapova", statusCont: "Last seen 40 minutes ago"))
        contArray.append(Contacts(imageCont: "Jason", nameCont: "Jason Statham", statusCont: "Online"))
        contArray.append(Contacts(imageCont: "Justin", nameCont: "Justin Timberlake", statusCont: "Last seen 20 minutes ago"))
        contArray.append(Contacts(imageCont: "Penelope", nameCont: "Penelope Cruz", statusCont: "Last seen 20 minutes ago"))
        
        
        var _: Contacts = contArray[0]
    }
    func setupViews() {
        view.addSubview(searchCVTextField)
        view.addSubview(searchCVImageView)
        view.addSubview(collectionView)
        
    }
    func setupConstraints() {
       
        searchCVTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(95)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(36)
        }
        
        searchCVImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(103)
            make.leading.equalTo(24)
            make.height.width.equalTo(20)
        }
        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.top.equalTo(searchCVTextField.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ChatsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()
        }
        if indexPath.row < contArray.count {
                let contact = contArray[indexPath.row]
                cell.configure(with: contact)
            }
            return cell
    }
}
extension ChatsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ChatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 68)
    }
}
