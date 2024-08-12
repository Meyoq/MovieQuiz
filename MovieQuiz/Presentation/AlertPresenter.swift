//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 20.07.2024.
//

import UIKit

final class AlertPresenter: AlertPresenterProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    func show(alertModel: AlertModel) {
        let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { [weak self] _ in
            guard self != nil else { return }
            alertModel.buttonAction()}
        alert.addAction(action)
        viewController?.present(alert, animated: true)
    }
}


