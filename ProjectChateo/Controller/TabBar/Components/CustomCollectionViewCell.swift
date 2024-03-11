//
//  CustomCollectionViewCell.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 11/3/24.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CustomCollectionViewCell.self)
    
    private lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.isPagingEnabled = true
           scrollView.showsHorizontalScrollIndicator = true
           return scrollView
       }()
       
       private lazy var customContentView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           return view
       }()
    
    private lazy var contactCVImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    } ()
    
    private lazy var nameCVLabel: UILabel = {
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
    
    private lazy var statusCVLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 12)
        title.textColor = UIColor(named: "textcolorphone")
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    } ()
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ads: Contacts) {
        //        estateImageView.image = UIImage(named: ads.estateImage[0])
        contactCVImageView.image = UIImage(named: ads.imageCont)
        nameCVLabel.text = ads.nameCont
        statusCVLabel.text = ads.statusCont
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        // Обновление ширины customContentView на основе размера контента
        customContentView.snp.makeConstraints { make in
            make.width.equalTo(nameCVLabel.snp.width).offset(16 + 48 + 12 + 12 + 16) // Учтите другие отступы, если они есть
        }
    }
    
    private func setupConstraints() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(customContentView)
        customContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(scrollView.snp.height)
//            make.width.equalToSuperview()
        }
        
        customContentView.addSubview(contactCVImageView)
        contactCVImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(48)
        }
        
        customContentView.addSubview(nameCVLabel)
        nameCVLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalTo(contactCVImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(24)
        }
        customContentView.addSubview(statusCVLabel)
        statusCVLabel.snp.makeConstraints { make in
            make.top.equalTo(nameCVLabel.snp.bottom).offset(2)
            make.leading.equalTo(contactCVImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
    }
   
}


