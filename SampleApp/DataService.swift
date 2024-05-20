//
//  DataService.swift
//  SampleApp
//
//  Created by Geeta Bhat on 16/05/24.
//

import Foundation
import Combine
import Resolver

protocol DataServiceProtocol {
    func fetchDetails() -> AnyPublisher<DataModel, Error>
}


class DataService: DataServiceProtocol {
    private let url = URL(string: Constant.API.dataURL)!

     func fetchDetails() -> AnyPublisher<DataModel, Error> {
         URLSession.shared.dataTaskPublisher(for: url)
             .map(\.data)
             .decode(type: DataModel.self, decoder: JSONDecoder())
             .eraseToAnyPublisher()
     }
}
