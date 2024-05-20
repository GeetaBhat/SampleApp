//
//  Resolver+XCTest.swift
//  SampleAppTests
//
//  Created by Geeta Bhat on 20/05/24.
//

import Foundation
import Resolver
@testable import SampleApp

extension Resolver {
    // MARK: - Mock Container
    static var mock = Resolver(child: .main)

  // MARK: - Register Mock Services
    static func registerMockServices() {
    root = Resolver.mock
    defaultScope = .application
    Resolver.mock.register { MockDataService() }
      .implements(DataServiceProtocol.self)
    }
}
