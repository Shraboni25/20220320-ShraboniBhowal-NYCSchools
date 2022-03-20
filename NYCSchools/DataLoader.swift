//
//  DataLoader.swift
//  NYCSchools
//
//  Created by Shraboni on 3/18/22.
//

import Foundation

class DataLoader {
    
    public var isLoading: Bool = false
    static let shared = DataLoader()
    private let scoresURL = URLRequest(url: URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!)
    private let schoolsURL = URLRequest(url: URL(string:
"https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!)
    var isLoadingMore:Bool = false
    var canLoadMore: Bool = true
    var schools: [School] = []
    
    
    private init(){}
        
    var count: Int = 0
    
    func load(_ completion: ( (Bool) -> Void)?) {
    let dataTask = URLSession.shared.dataTask(with: scoresURL.url!){ data, urlResponse, error in
            do {
                if let error = error as NSError?, error.domain == NSURLErrorDomain, error.code == NSURLErrorCannotConnectToHost {
                    // Special case for mock server not running
                    throw ResponseError.unableToConnect(error)
                }
                
                guard let urlResponse = urlResponse as? HTTPURLResponse else {
                    throw error ?? ResponseError.unknown
                }
                
                guard (200 ..< 300).contains(urlResponse.statusCode) else {
                    throw ResponseError.badResponseStatusCode(urlResponse.statusCode)
                }
                                    
                let schools = try? JSONDecoder().decode([School].self, from: data!)
                guard let schools = schools else {
                    throw ResponseError.serializationError
                }
                self.schools = schools
                completion?(true)
            }
            catch {
                completion?(false)
            }
        }
        dataTask.resume()
    }
    
    //API to retrieve school info
    func loadDescription(_ completion: ( (Bool) -> Void)?) {
    let dataTask = URLSession.shared.dataTask(with: schoolsURL.url!){ data, urlResponse, error in
            do {
                if let error = error as NSError?, error.domain == NSURLErrorDomain, error.code == NSURLErrorCannotConnectToHost {
                    // Special case for mock server not running
                    throw ResponseError.unableToConnect(error)
                }
                
                guard let urlResponse = urlResponse as? HTTPURLResponse else {
                    throw error ?? ResponseError.unknown
                }
                
                guard (200 ..< 300).contains(urlResponse.statusCode) else {
                    throw ResponseError.badResponseStatusCode(urlResponse.statusCode)
                }
                                    
                let schools = try? JSONDecoder().decode([SchoolDescriptoion].self, from: data!)
//                Deserialize school description
//                guard let schools = schools else {
//                    throw ResponseError.serializationError
//                }
                completion?(true)
            }
            catch {
                completion?(false)
            }
        }
        dataTask.resume()
    }
        
    enum ResponseError: Error {
        case badResponseStatusCode(Int)
        case noProducts
        case unableToConnect(Error)
        case unknown
        case serializationError
    }
}
