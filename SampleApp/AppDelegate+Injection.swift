//
//  AppDelegate+Injection.swift
//  SampleApp
//
//  Created by Geeta Bhat on 15/05/24.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { DataService() }
        register { DataViewModel()}
    }
}
