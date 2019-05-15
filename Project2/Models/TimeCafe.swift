//
//  TimeCafe.swift
//  Project2
//
//  Created by Kudusov Mahmud on 4/22/19.
//  Copyright © 2019 Mahmud. All rights reserved.
//

import Foundation
// associated value 
enum FeatureType: String, Codable {
    case playstation = "playstation"
    case board_games = "board_games"
    case rooms = "rooms"
    case ping_pong = "ping_pong"
    case hookah = "hookah"
    case musical_instrument = "musical_instrument"
};


struct Feature: Codable {
    let feature: FeatureType
}

struct Image: Codable {
    let image: String
}

let featureOrder:[Feature] = [Feature(feature: .playstation), Feature(feature: .rooms), Feature(feature: .board_games), Feature(feature: .ping_pong), Feature(feature: .musical_instrument), Feature(feature: .hookah)]

struct TimeCafeJson: Codable {
    let id: Int
    let main_image_url: String
    let name: String
    let rating: Float
    let latitude: Double
    let longtitude: Double
    let distance: Double?
    let price: Float
    let price_type: Int
    let address: String
    let station: String
    let website: String
    let phone_number: String
    let images: [Image]?
    let features: [Feature]?
    let working_time: String
    let extended_price: String
}

struct Price {
    let description: String
    let price: String
    init(description: String, price: String) {
        self.description = description
        self.price = price
    }
}


extension TimeCafeJson {
    func getWorkingTimeByDays() -> [String] {
        if self.working_time == "" {
            return [String]()
        }

        let arr = self.working_time.components(separatedBy: "|")
        return arr
    }

    func getPrices() -> [Price] {
        if self.extended_price == "" {
            return [Price]()
        }
        let arr = self.extended_price.components(separatedBy: "|")

        var prices = [Price]()
        var description = ""
        var price = ""
        var index = 0
        for item in arr {
            if item != "" {
                if index % 2 == 0 {
                    description = item
                } else {
                    price = item
                    prices.append(Price(description: description, price: price))
                }
                index += 1
            }
        }
        return prices
    }

}