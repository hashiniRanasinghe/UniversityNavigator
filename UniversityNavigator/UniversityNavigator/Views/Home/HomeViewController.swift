// Views/Home/HomeViewController.swift
import UIKit

struct HomeViewController: View {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let quickAccessStack = UIStackView()
    
    // Make coordinator public so it can be set from outside
    var coordinator: NavigationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        // Don't create coordinator here - it should be passed in
    }
    
    private func setupUI() {
        view.backgroundColor = .primaryBackground
        title = "Campus Navigator"
        
        // Setup scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Setup title
        titleLabel.text = "Welcome to Campus"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .primaryText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // Setup search bar
        searchBar.placeholder = "Search locations, buildings..."
        searchBar.backgroundColor = .secondaryBackground
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(searchBar)
        
        // Setup quick access buttons
        setupQuickAccessButtons()
        
        // Layout
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            quickAccessStack.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30),
            quickAccessStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            quickAccessStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            quickAccessStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupQuickAccessButtons() {
        quickAccessStack.axis = .vertical
        quickAccessStack.spacing = 15
        quickAccessStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(quickAccessStack)
        
        let buttonData = [
            ("Library", "📚", { [weak self] in self?.coordinator?.showLibraries() }),
            ("Canteen", "🍽️", { [weak self] in self?.coordinator?.showCanteens() }),
            ("Gym", "🏋️", { [weak self] in self?.coordinator?.showGym() }),
            ("Parking", "🚗", { [weak self] in self?.coordinator?.showParking() }),
            ("Campus Map", "🗺️", { [weak self] in self?.coordinator?.showMap() }),
            ("Resources", "📋", { [weak self] in self?.coordinator?.showResources() })
        ]
        
        for (title, emoji, action) in buttonData {
            let button = createQuickAccessButton(title: title, emoji: emoji, action: action)
            quickAccessStack.addArrangedSubview(button)
        }
    }
    
    private func createQuickAccessButton(title: String, emoji: String, action: @escaping () -> Void) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .secondaryBackground
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.font = .systemFont(ofSize: 24)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.textColor = .primaryText
        
        let arrowLabel = UILabel()
        arrowLabel.text = "›"
        arrowLabel.font = .systemFont(ofSize: 20, weight: .medium)
        arrowLabel.textColor = .secondaryText
        
        stackView.addArrangedSubview(emojiLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(UIView()) // Spacer
        stackView.addArrangedSubview(arrowLabel)
        
        button.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60),
            stackView.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10)
        ])
        
        button.addAction(UIAction { _ in action() }, for: .touchUpInside)
        
        return button
    }
    
    private func setupNavigationBar() {
        // Add theme toggle button
        let themeButton = UIBarButtonItem(
            image: UIImage(systemName: "moon.circle"),
            style: .plain,
            target: self,
            action: #selector(toggleTheme)
        )
        navigationItem.rightBarButtonItem = themeButton
    }
    
    @objc private func toggleTheme() {
        let currentStyle = view.traitCollection.userInterfaceStyle
        ThemeManager.shared.setTheme(currentStyle == .dark ? .light : .dark)
    }
}
#Preview {
    HomeViewController()
}

