//
//  CharacterTableViewCell.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterStatusAndSpeciesLabel: UILabel!
    @IBOutlet weak var characterLastKnownLocationLabel: UILabel!
    @IBOutlet weak var characterOriginLabel: UILabel!
    
    // MARK: - Variables
    var character: CharacterResult? {
        didSet {
            configureCharacterDetails()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCharacterDetails() {
        guard let character else { return }
        
        characterNameLabel.text = character.name
        characterStatusAndSpeciesLabel.text = "\(character.status.rawValue) - \(character.species.rawValue)"
        characterLastKnownLocationLabel.text = character.location.name
        characterOriginLabel.text = character.origin.name
        characterImageView.loadImage(with: character.image)
    }
}
