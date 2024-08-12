//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 18.07.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}
