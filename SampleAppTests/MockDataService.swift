//
//  MockDataService.swift
//  SampleAppTests
//
//  Created by Geeta Bhat on 20/05/24.
//

import Foundation
import Combine
@testable import SampleApp

class MockDataService: DataServiceProtocol {
    var result: AnyPublisher<DataModel, Error>?
    
    func fetchDetails() -> AnyPublisher<SampleApp.DataModel, Error> {
        if let result {
            return result
        }else {
            fatalError("Result should not be nil")
        }
    }
}
