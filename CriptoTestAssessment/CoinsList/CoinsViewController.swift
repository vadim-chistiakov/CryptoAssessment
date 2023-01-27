//
//  CoinsViewController.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 20.01.2023.
//

import UIKit

final class CoinsViewController: UIViewController {
    
    
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(CoinCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let viewModel: CoinsViewModel

    init(viewModel: CoinsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationItem.setRightBarButtonItems([.init(
            title: "logout",
            style: .plain,
            target: self,
            action: #selector(logout))], animated: false)
        viewModel.loadCoins { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @objc private func logout() {
        viewModel.logout()
    }
}

extension CoinsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.answers[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CoinCell
        else { return .init() }
        
        cell.label.text = "\(model.data.name) \(model.data.symbol)"
        
        return cell
    }
    
}
