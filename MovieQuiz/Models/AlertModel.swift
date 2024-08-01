//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 20.07.2024.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    let buttonAction: () -> ()
}

