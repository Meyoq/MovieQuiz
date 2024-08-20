//
//  MovieQuizPresenterTests.swift
//  MovieQuizTests
//
//  Created by Олег Дерябин on 19.08.2024.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewController {
    override func changeStateButton(isEnabled: Bool) {
    
    }
    
    override func show(quiz step: QuizStepViewModel) {
    
    }
    
    override func show(quiz result: QuizResultsViewModel) {
    
    }
    
    override func highlightImageBorder(isCorrect: Bool) {
    
    }
    
    override func showLoadingIndicator() {
    
    }
    
    override func hideLoadingIndicator() {
    
    }
    
    override func showNetworkError(message: String) {
    
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        // В этом месте икскод выдаёт ошибку "Cannot convert value of type 'MovieQuizViewControllerMock' to expected argument type 'MovieQuizViewController'" поэтому я бурал final class у MovieQuizViewController и унаследовал его в MovieQuizViewControllerMock вместо MovieQuizViewControllerProtocol, чтобы убрать ошибку
        // Если подскажите как оставить MovieQuizViewControllerProtocol и чтобы не возникало такой ошибки, буду признателен
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
         XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
