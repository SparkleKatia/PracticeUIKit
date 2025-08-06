import UIKit

// MARK: - Solution 1 – Flashcard Flip
// didSet toggles display each time showingDefinition changes.

struct VocabularyEntry {
    let word: String
    let definition: String
}

final class FlashcardFlipViewController: UIViewController {
    private let cards = [
        VocabularyEntry(word: "loquacious", definition: "talkative"),
        VocabularyEntry(word: "elated",     definition: "very happy"),
        VocabularyEntry(word: "obstinate",  definition: "stubborn")
    ]

    private var index = 0
    private var showingDefinition = false {
        didSet { updateCard() }   // didSet immediately updates UI on toggle
    }

    private let cardLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        updateCard()
    }

    private func setup() {
        cardLabel.font = .preferredFont(forTextStyle: .largeTitle)
        cardLabel.numberOfLines = 0
        cardLabel.textAlignment = .center
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardLabel)
        NSLayoutConstraint.activate([
            cardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            cardLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flip)))
    }

    @objc private func flip() {
        showingDefinition.toggle()  // didSet fires, updateCard refreshes label
    }

    private func updateCard() {
        let entry = cards[index]
        cardLabel.text = showingDefinition ? entry.definition : entry.word
    }
}

// Explanation:
// – Programming goal: demonstrates property observers by reacting to state change of `showingDefinition`.
// – English goal: learner taps to reveal definition, reinforcing vocabulary recall.
