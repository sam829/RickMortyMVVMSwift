//
//  CharacterViewModel.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import Foundation

final class CharacterViewModel {
    
    // MARK: - Variables
    var characters : Character?
    var eventHandler: ((_ event: DataEvent) -> Void)?
    
    func fetchCharacters() {
        self.eventHandler?(.loading)
        
        NetworkHelper.shared.fetchCharacterDetails { result in
            self.eventHandler?(.finishLoading)
            switch result {
            case .success(let characters):
                self.characters = characters
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}


