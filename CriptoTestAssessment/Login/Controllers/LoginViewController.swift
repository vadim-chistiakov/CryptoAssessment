//
//  LoginViewController.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit
import SnapKit

//финальный класс - у него не будет наследников
//Меняет диспетчеризация (вызов методов)

final class LoginViewController: UIViewController {
    
    //добавить юай элементы
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = "1234" // хардкод
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "1234" // хардкод
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to coins", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    //Dependancy injection
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    //для сторибордов
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    
    @objc
    func didTapButton() {
        viewModel.didTapNextButton(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
    

}
