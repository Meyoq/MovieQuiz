//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Олег Дерябин on 22.07.2024.
//

import UIKit


final class StatisticService: StatisticServiceProtocol {
  
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correctTotal
        case bestGame
        case gamesCount
        case totalAccuracy
    }
    
    var correctTotal: Int {
        get { storage.integer(forKey: Keys.correctTotal.rawValue)}
        set { storage.set(newValue, forKey: Keys.correctTotal.rawValue)}}
    
    var totalAccuracy: Double {
        get { storage.double(forKey: "totalAccuracy")}
        set { storage.set(newValue, forKey: "totalAccuracy")}}
    
    var gamesCount: Int {
        get { storage.integer(forKey: Keys.gamesCount.rawValue)}
        set { storage.set(newValue, forKey: Keys.gamesCount.rawValue)}}

    var bestGame: GameResult {
        get { GameResult(correct: storage.integer(forKey: "correct"),
                         total: storage.integer(forKey: "total"),
                         date: storage.object(forKey: "date") as? Date ?? Date())}
        set {storage.set(newValue.correct, forKey: "correct")
            storage.set(newValue.total, forKey: "total")
            storage.set(newValue.date, forKey: "date")}}

    func store(correct count: Int, total amount: Int) {
         let newGame = GameResult(correct: count, total: amount, date: Date())
         if newGame.isBetterThan(bestGame) {
             bestGame = newGame
         }
         correctTotal += count
         gamesCount += 1
         totalAccuracy = (Double(correctTotal) / Double(10 * gamesCount)) * 100
            }
    }


