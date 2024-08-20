import UIKit

class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
// убрал final class т.к. в дальнейшем возникает ошибка при использовании протокола в тестах MovieQuizPresenterTests, как убрать ошибку не знаю
    private var alertPresenter: AlertPresenterProtocol?
    private var presenter: MovieQuizPresenter!

    @IBOutlet private var noButton: UIButton!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       imageView.layer.cornerRadius = 20
        alertPresenter = AlertPresenter(viewController: self)
        presenter = MovieQuizPresenter(viewController: self)
    }

    func changeStateButton(isEnabled: Bool) {
        noButton.isEnabled = isEnabled
        yesButton.isEnabled = isEnabled
    }

    @IBAction private func yesButtonClicked(_ sender: Any) {
        presenter.yesButtonClicked()
    }

    @IBAction private func noButtonClicked(_ sender: Any) {
        presenter.noButtonClicked()
    }
    
    

     func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderWidth = 0
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
        changeStateButton(isEnabled: true)
    }

    func highlightImageBorder(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }

    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

     func showNetworkError(message: String) {
        hideLoadingIndicator()
        let model = AlertModel(title: "Ошибка",
                               message: message,
                               buttonText: "Попробовать еще раз") { [weak self] in
            guard let self = self else { return }

            self.presenter.resetGame()
        }
        alertPresenter?.show(alertModel: model)
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let message = presenter.makeResultMessage()

        let alert = UIAlertController(
            title: result.title,
            message: message,
            preferredStyle: .alert)
       
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
                guard let self = self else { return }

                self.presenter.resetGame()
            }

        alert.addAction(action)
        alert.view.accessibilityIdentifier = "Game results"

        self.present(alert, animated: true, completion: nil)
    }
}


  
  








  
  



