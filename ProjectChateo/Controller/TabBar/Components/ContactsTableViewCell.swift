//
//  ContactsTableViewCell.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 11/3/24.
//

import UIKit
import SnapKit

class ContactsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ContactsTableViewCell.self)
    
    private lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    } ()
    
    private lazy var nameLabel: UILabel = {
        let title = UILabel()
        //        let labelFrame = CGRect(x: 0, y: 0, width: length, height: 120)
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = UIColor(named: "textColor")
        // title.clipsToBounds = true
//        title.backgroundColor = UIColor(named: "backgroundTextColor")
        title.numberOfLines = 1
        title.textAlignment = .left
        return title
    } ()
    
    private lazy var statusLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 12)
        title.textColor = UIColor(named: "textcolorphone")
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    } ()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ads: Contacts) {
        //        estateImageView.image = UIImage(named: ads.estateImage[0])
        contactImageView.image = UIImage(named: ads.imageCont)
        nameLabel.text = ads.nameCont
        statusLabel.text = ads.statusCont
        
        
//        contactImageView.snp.remakeConstraints { make in
//            make.height.equalTo(48)
//        }
    }
    
    private func setupConstraints() {
        
        self.addSubview(contactImageView)
        contactImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(48)
        }
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalTo(contactImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(24)
        }
        self.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.leading.equalTo(contactImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
    }
}

