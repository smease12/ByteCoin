//
//  CoinData.swift
//  ByteCoin
//
//  Created by Serena  on 2/11/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable{
    let asset_id_quote: String
    let rate: Double
}
