//
//  DataViewModelTests.swift
//  SampleApp
//
//  Created by Geeta Bhat on 17/05/24.
//

import XCTest
import Combine
import Resolver
@testable import SampleApp

final class DataViewModelTests: XCTestCase {
    // MARK: - Properties
    @LazyInjected var dataService: MockDataService
    var sut: DataViewModel?
    
    override func setUp() {
        super.setUp()
        dataService = MockDataService()
        sut = DataViewModel()
        Resolver.registerMockServices()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchDataSuccessfully() {
    
        sut?.fetchData()
        
    }
}


