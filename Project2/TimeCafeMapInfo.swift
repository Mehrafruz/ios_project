//
//  TimeCafeMapInfo.swift
//  Project2
//
//  Created by Kudusov Mahmud on 5/12/19.
//  Copyright © 2019 Mahmud. All rights reserved.
//

import UIKit

class MyView: UIView {
    var lastImageView: UIImageView? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(nameLabel)
        self.addSubview(distanceLabel)
        self.addSubview(ratingLogoImageView)
        self.addSubview(ratingLabel)
        self.addSubview(addressLabel)
        self.addSubview(addressLogoImageView)
        self.addSubview(stationLabel)
        self.addSubview(stationLogoImageView)
        self.addSubview(timeLabel)
        self.addSubview(timeLogoImageView)
        self.addSubview(phoneLogoImageView)
        self.addSubview(phoneNumber)
        self.addSubview(priceLabel)
    }

    func getFeatureLogoPath(featureType: FeatureType) -> String? {
        switch featureType {
        case .playstation:
            return "gamepad"
        case .ping_pong:
            return "ping-pong"
        case .musical_instrument:
            return "acoustic-guitar"
        case .rooms:
            return "rooms"
        case .board_games:
            return "board-games"
        case .hookah:
            return "hookah"
        default:
            return nil
        }
    }

    func addFeatureIcon(feature: FeatureType) {
        print(feature)
        var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "metro_logo")
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if lastImageView == nil {
            print("all_ok")
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: phoneLogoImageView.bottomAnchor, constant: 10).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        } else {
            print("not all ok")
            imageView.leftAnchor.constraint(equalTo: self.lastImageView!.rightAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: phoneLogoImageView.bottomAnchor, constant: 10).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
        }
        print("feature logo path" + getFeatureLogoPath(featureType: feature)!)
        imageView.image = UIImage(named: getFeatureLogoPath(featureType: feature) ?? "gamepad")
        lastImageView = imageView
    }
    
    func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        stationLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        addressLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        timeLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        ratingLogoImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

        distanceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        distanceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        ratingLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        ratingLogoImageView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 10).isActive = true
        ratingLogoImageView.heightAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        ratingLogoImageView.widthAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true

//        ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: self.distanceLabel.bottomAnchor, constant: 10).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: ratingLogoImageView.rightAnchor, constant: 10).isActive = true

        addressLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        addressLogoImageView.topAnchor.constraint(equalTo: ratingLogoImageView.bottomAnchor, constant: 10).isActive = true
        addressLogoImageView.heightAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        addressLogoImageView.widthAnchor.constraint(equalToConstant: CGFloat(18)).isActive = true

        addressLabel.leftAnchor.constraint(equalTo: addressLogoImageView.rightAnchor, constant: 5).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        addressLabel.topAnchor.constraint(equalTo: ratingLogoImageView.bottomAnchor, constant: 10).isActive = true

        stationLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        stationLogoImageView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 6).isActive = true
        stationLogoImageView.heightAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        stationLogoImageView.widthAnchor.constraint(equalToConstant: CGFloat(18)).isActive = true

        stationLabel.leftAnchor.constraint(equalTo: stationLogoImageView.rightAnchor, constant: 5).isActive = true
        stationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        stationLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 6).isActive = true

        timeLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        timeLogoImageView.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 10).isActive = true
        timeLogoImageView.heightAnchor.constraint(equalToConstant: CGFloat(18)).isActive = true
        timeLogoImageView.widthAnchor.constraint(equalToConstant: CGFloat(18)).isActive = true

        timeLabel.leftAnchor.constraint(equalTo: timeLogoImageView.rightAnchor, constant: 5).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 10).isActive = true

        phoneLogoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        phoneLogoImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10).isActive = true
        phoneLogoImageView.heightAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        phoneLogoImageView.widthAnchor.constraint(equalToConstant: CGFloat(18)).isActive = true

        phoneNumber.leftAnchor.constraint(equalTo: phoneLogoImageView.rightAnchor, constant: 5).isActive = true
        phoneNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        phoneNumber.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10).isActive = true


    }

    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    var distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = NSTextAlignment.left
        return label
    }()

    var ratingLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icons8-rating-64")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
//        label.layer.cornerRadius = 10
//        label.layer.masksToBounds = true
//        label.backgroundColor = UIColor.init(displayP3Red: 0.3, green: 0.8, blue: 1, alpha: 1)
        label.textColor = .black
        return label
    }()

    var addressLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location_logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var addressLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var stationLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "metro_logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()


    var stationLabel: UILabel = {
        let label = UILabel()
        return label
    }()


    //icons8-time-64

    var timeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icons8-time-64")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var phoneLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icons8-phone-48")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var phoneNumber: UILabel = {
        let label = UILabel()
        return label
    }()

    var priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}

