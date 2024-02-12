//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=%205B24E9A7-5CCC-49FC-8401-17A7C776921D"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a url
        
        if let url = URL(string: urlString){
            
            //2. Create a URLsession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                  //  self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let exchangeRate = self.parseJSON(exchangeRate: safeData){
                        //self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(exchangeRate: Data) -> CoinData?{
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode(CoinData.self, from: exchangeRate)
            let rate = decodedData.rate
            return rate
        } catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
