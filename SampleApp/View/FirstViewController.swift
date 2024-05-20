//
//  FirstViewController.swift
//  SampleApp
//
//  Created by Geeta Bhat on 15/05/24.
//

import UIKit
import Resolver
import Combine

class FirstViewController: UIViewController, Resolving {

    // Properties
    var viewModel: DataViewModel = Resolver.resolve()

    private var cancellable: AnyCancellable?

    // UI Elements
    private let button: UIButton = {
        let button = UIButton()
          button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
          button.setTitle("Fetch Data", for: .normal)
        return button
    }()
    
    private var textView = {
        let textView = UITextView(frame: CGRect(x: 100, y: 200, width: 250, height: 100))
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        viewModel = DataViewModel()
        self.button.addTarget(self, action: #selector(getData), for: .touchUpInside)
        self.view.addSubview(button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 44)

        ])
       
        //Add Textview
        self.view.addSubview(textView)

                        
    }
    
    @objc func getData(sender: UIButton!) {
    
        viewModel.fetchData()
        cancellable = viewModel.objectWillChange.sink{[weak self] in
            DispatchQueue.main.async {
                if let result = self?.viewModel.responseData {
                    self?.textView.text = "\(result.name) \(result.age) \(result.count)"
                }
            }
        }
    }
}

