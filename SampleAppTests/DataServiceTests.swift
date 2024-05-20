//
//  DataServiceTests.swift
//  SampleAppTests
//
//  Created by Geeta Bhat on 20/05/24.
//
import Resolver
import XCTest
import Combine
@testable import SampleApp

final class DataServiceTests: XCTestCase {
    // MARK: - Properties
    @LazyInjected var dataService: MockDataService
    var sut: DataService?
    @Published var testData: DataModel?
    private var cancellables = Set<AnyCancellable>()
    // MARK: - Life Cycle
      override func setUp() {
          super.setUp()
          sut = DataService()
          Resolver.registerMockServices()
      }

      override func tearDown() {
          sut = nil
          super.tearDown()
      }
  }

  // MARK: - Unit tests
extension DataServiceTests: ObservableObject {
      
    func testFetchDataSuccessfully() {
        var data = mockData()

        sut?.fetchDetails()
            .sink(receiveCompletion: {_ in }) { data in
                print(data)
            }
            .store(in: &cancellables)
    }
  }

  // MARK: - Helper functions
  extension DataServiceTests {
      private func mockData() -> DataModel {
          DataModel(name: "Geeta", count: 44, age: 35)
      }
  }
