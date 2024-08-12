//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 18.07.2024.
//

import Foundation

protocol QuestionFactoryDelegate {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
