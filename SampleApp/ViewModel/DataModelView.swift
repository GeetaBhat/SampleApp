//
//  DataModelView.swift
//  SampleApp
//
//  Created by Geeta Bhat on 15/05/24.
//

import Foundation
import Combine
import Resolver

final class DataViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Injected private var dataService: DataService
    @Published var responseData: DataModel?
    
    func fetchData() {
        dataService.fetchDetails()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in }) { data in
                self.responseData = data
                
            }
            .store(in: &cancellables)
    }
}

