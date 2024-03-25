import UIKit

class SearchBottomSheet: UIView {
    var howdyLabel: UILabel!
    var searchBar: UISearchBar!
    var tableViewSearchResults: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 51/255, green: 52/255, blue: 71/255, alpha: 1)
        setupHowdyLabel()
        setupSearchBar()
        setupTableViewSearchResults()
        initConstraints()
    }
    
    func setupHowdyLabel() {
        howdyLabel = UILabel()
        howdyLabel.text = "Hello there, Aadesh"
        howdyLabel.textColor = .white
        howdyLabel.textAlignment = .center
        howdyLabel.font = UIFont.boldSystemFont(ofSize: 22)
        howdyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(howdyLabel)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.placeholder = "Where are we going?"
        searchBar.showsCancelButton = true
        searchBar.autocapitalizationType = .none
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = .gray // Set search bar background color to gray
        searchBar.tintColor = .white // Set search bar text color to white
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(.white, for: .normal) // Set cancel button text color to white
        }
        self.addSubview(searchBar)
    }
    
    func setupTableViewSearchResults() {
        tableViewSearchResults = UITableView()
        tableViewSearchResults.register(SearchTableViewCell.self, forCellReuseIdentifier: Configs.searchTableViewID)
        tableViewSearchResults.translatesAutoresizingMaskIntoConstraints = false
        tableViewSearchResults.backgroundColor = .clear // Set table view background color to clear
        tableViewSearchResults.separatorColor = .white // Set table view separator color to white
        self.addSubview(tableViewSearchResults)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            howdyLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -10),
            howdyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10),
            howdyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            howdyLabel.heightAnchor.constraint(equalToConstant: 24),
            
            searchBar.topAnchor.constraint(equalTo: howdyLabel.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            tableViewSearchResults.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            tableViewSearchResults.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableViewSearchResults.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            tableViewSearchResults.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
