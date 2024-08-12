//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 22.07.2024.
//

import Foundation

protocol StatisticServiceProtocol {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }

    func store(correct count: Int, total amount: Int)
}
