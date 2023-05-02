//
//  CharacterListViewController.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var charactersTableView: UITableView!
    
    // MARK: - Variables
    private let viewModel = CharacterViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        registerTableViewCell()
        configure()
    }
    
    // MARK: - TableView
    private func registerTableViewCell() {
        let characterCell = UINib(nibName: Constants.CharacterCell.reuseIdentifier, bundle: nibBundle)
        self.charactersTableView.register(characterCell, forCellReuseIdentifier: Constants.CharacterCell.reuseIdentifier)
    }
}

// MARK: - View Model
extension CharacterListViewController {
    func configure() {
        initViewModel()
        handleDataEvent()
    }
    
    func initViewModel() {
        viewModel.fetchCharacters()
    }
    
    func handleDataEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                debugPrint("Items are loading")
            case .finishLoading:
                debugPrint("Items are loaded")
            case .dataLoaded:
                debugPrint("Data is loaded")
                DispatchQueue.main.async {
                    self.charactersTableView.reloadData()
                }
            case .error(let error):
                debugPrint(error?.localizedDescription ?? "something went wrong")
            }
        }
    }
}

// MARK: - TableView DataSource and Delegate
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CharacterCell.reuseIdentifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.character = viewModel.characters?.results[indexPath.row]
        
        return cell
    }
}
